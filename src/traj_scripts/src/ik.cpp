#include <rclcpp/rclcpp.hpp>
#include <moveit/move_group_interface/move_group_interface.h>
#include <moveit/robot_state/robot_state.h>
#include <geometry_msgs/msg/pose.hpp>
#include <std_msgs/msg/float64_multi_array.hpp>
#include <sensor_msgs/msg/joint_state.hpp> 
#include <memory>
#include <thread>
#include <optional>
#include <limits> 

// Compute IK for a single target pose using home position as seed
// Returns the joint solution if found, otherwise nullopt
std::optional<std::vector<double>> computeIK(
  moveit::planning_interface::MoveGroupInterface& move_group,
  const geometry_msgs::msg::Pose& target_pose) {
  
  // Create a fresh robot state and set to home position as seed
  const moveit::core::RobotModelConstPtr& robot_model = move_group.getRobotModel();
  moveit::core::RobotStatePtr robot_state = std::make_shared<moveit::core::RobotState>(robot_model);
  
  const moveit::core::JointModelGroup* jmg = robot_state->getJointModelGroup(move_group.getName());
  if (!jmg) {
    std::cerr << "Failed to get joint model group" << std::endl;
    return std::nullopt;
  }

  // Set robot state to home position as seed
  robot_state->setToDefaultValues(jmg, "home");
  
  // Call setFromIK to compute IK solution from home position
  bool ik_success = robot_state->setFromIK(jmg, target_pose, 0.5);
  
  if (ik_success) {
    std::vector<double> joint_values;
    robot_state->copyJointGroupPositions(jmg, joint_values);
    return joint_values;
  }
  
  return std::nullopt;
}

class IKNode : public rclcpp::Node {
public:
  IKNode() : Node("ik_node") {
    RCLCPP_INFO(this->get_logger(), "Initializing IK Node...");

    // Create separate MoveIt node and executor (same pattern as graph_ik)
    moveit_node_ = std::make_shared<rclcpp::Node>("ik_moveit_node");
    moveit_executor_ = std::make_shared<rclcpp::executors::SingleThreadedExecutor>();
    moveit_executor_->add_node(moveit_node_);
    
    // Spin MoveIt node in background thread to keep CurrentStateMonitor synced
    moveit_spin_thread_ = std::thread([this]() {
      RCLCPP_INFO(this->get_logger(), "Started MoveIt executor thread");
      moveit_executor_->spin();
    });

    // Initialize MoveGroupInterface
    move_group_ = std::make_shared<moveit::planning_interface::MoveGroupInterface>(moveit_node_, "arm_group");
    
    // Start state monitor
    move_group_->startStateMonitor();
    RCLCPP_INFO(this->get_logger(), "MoveGroupInterface initialized for planning group: %s", 
                move_group_->getName().c_str());

    // Create subscriber for target poses (geometry_msgs::msg::Pose)
    target_sub_ = this->create_subscription<geometry_msgs::msg::Pose>(
      "/target_ik",
      rclcpp::QoS(10),
      std::bind(&IKNode::targetCallback, this, std::placeholders::_1));

    // Create publisher for IK solutions (Float64MultiArray of joint positions)
    ik_sol_pub_ = this->create_publisher<std_msgs::msg::Float64MultiArray>(
      "/ik_sol",
      rclcpp::QoS(10));

    // Create publisher for ghost joint states  
    ghost_js_pub_ = this->create_publisher<sensor_msgs::msg::JointState>(
      "/ghost/ghost_joint_states", rclcpp::QoS(10));

    RCLCPP_INFO(this->get_logger(), "IK Node ready. Subscribed to /target_ik, publishing to /ik_sol");
  }

  ~IKNode() {
    if (moveit_executor_) {
      moveit_executor_->cancel();
    }
    if (moveit_spin_thread_.joinable()) {
      moveit_spin_thread_.join();
    }
  }

private:
  void targetCallback(const geometry_msgs::msg::Pose::SharedPtr msg) {
    RCLCPP_INFO(this->get_logger(), "Received target pose: [%.3f, %.3f, %.3f] orientation: [%.3f, %.3f, %.3f, %.3f]",
                msg->position.x, msg->position.y, msg->position.z,
                msg->orientation.x, msg->orientation.y,
                msg->orientation.z, msg->orientation.w);

    auto solution = computeIK(*move_group_, *msg);

    // Prepare Float64MultiArray for IK solution
    std_msgs::msg::Float64MultiArray out;
    out.layout.dim.resize(1);
    out.layout.dim[0].label = "joints";
    out.layout.data_offset = 0;

    // Build ghost joint names by appending "_ghost" to each original joint name
    const auto* jmg = move_group_->getRobotModel()->getJointModelGroup(move_group_->getName());
    std::vector<std::string> ghost_joint_names;
    if (jmg) {
      const auto& orig_names = jmg->getVariableNames();
      ghost_joint_names.reserve(orig_names.size());
      for (const auto& name : orig_names) {
        ghost_joint_names.push_back(name + "_ghost");
      }
    }

    // Prepare JointState message for ghost
    sensor_msgs::msg::JointState js;
    js.header.stamp = this->now();
    js.name = ghost_joint_names;

    const size_t n = ghost_joint_names.size();

    if (solution) {
      // Ensure sizes match names (pad/truncate as needed)
      std::vector<double> joints = *solution;
      if (joints.size() < n) joints.resize(n, std::numeric_limits<double>::quiet_NaN());
      if (joints.size() > n) joints.resize(n);

      // Publish Float64MultiArray
      out.data = joints;
      out.layout.dim[0].size = out.data.size();
      out.layout.dim[0].stride = out.data.size();
      ik_sol_pub_->publish(out);

      // Publish ghost JointState
      js.position = joints;
      ghost_js_pub_->publish(js);

      RCLCPP_INFO(this->get_logger(), "Published IK solution (%zu joints) to /ik_sol and /ghost/ghost_joint_states", joints.size());
    } else {
      // Publish NaNs when IK fails
      std::vector<double> nan_joints(n, std::numeric_limits<double>::quiet_NaN());

      out.data = nan_joints;
      out.layout.dim[0].size = n;
      out.layout.dim[0].stride = n;
      ik_sol_pub_->publish(out);

      js.position = nan_joints;
      ghost_js_pub_->publish(js);

      RCLCPP_WARN(this->get_logger(), "IK failed. Published NaNs to /ik_sol and /ghost/ghost_joint_states");
    }
  }

  rclcpp::Subscription<geometry_msgs::msg::Pose>::SharedPtr target_sub_;
  rclcpp::Publisher<std_msgs::msg::Float64MultiArray>::SharedPtr ik_sol_pub_;
  rclcpp::Publisher<sensor_msgs::msg::JointState>::SharedPtr ghost_js_pub_; // <-- new member

  std::shared_ptr<rclcpp::Node> moveit_node_;
  std::shared_ptr<rclcpp::executors::SingleThreadedExecutor> moveit_executor_;
  std::thread moveit_spin_thread_;
  std::shared_ptr<moveit::planning_interface::MoveGroupInterface> move_group_;
};

int main(int argc, char** argv) {
  rclcpp::init(argc, argv);
  auto node = std::make_shared<IKNode>();
  rclcpp::spin(node);
  rclcpp::shutdown();
  return 0;
}
