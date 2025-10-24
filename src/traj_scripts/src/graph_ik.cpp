#include <rclcpp/rclcpp.hpp>
#include <std_msgs/msg/string.hpp>
#include <geometry_msgs/msg/pose.hpp>
#include <moveit/move_group_interface/move_group_interface.h>
#include <moveit/robot_state/robot_state.h>
#include <nlohmann/json.hpp>
#include <thread>
#include <memory>
#include <optional>

using json = nlohmann::json;

// Parse JSON string into list of 3D points
std::vector<std::vector<double>> parsePoints(const std::string& json_str) {
  std::vector<std::vector<double>> points;
  try {
    json j = json::parse(json_str);
    for (const auto& pt : j) {
      if (pt.size() == 3) {
        points.push_back({pt[0], pt[1], pt[2]});
      }
    }
  } catch (const std::exception& e) {
    std::cerr << "JSON parse error: " << e.what() << std::endl;
  }
  return points;
}

// Compute IK for a single target pose using an optional seed state
// Returns the joint solution if found, otherwise nullopt
std::optional<std::vector<double>> computeIK(
  moveit::planning_interface::MoveGroupInterface& move_group,
  const std::vector<double>& point,
  const std::optional<std::vector<double>>& seed_state = std::nullopt) {
  std::cout << "\nPoint: [" << point[0] << ", " << point[1] << ", " << point[2] << "]" << std::endl;

  // Create target pose
  geometry_msgs::msg::Pose target_pose;
  target_pose.position.x = point[0];
  target_pose.position.y = point[1];
  target_pose.position.z = point[2];
  // Orient the tool Z-axis to point DOWN (world -Z).
  // 180 deg about Y-axis => quaternion [x=0, y=1, z=0, w=0]
  target_pose.orientation.x = 0.0;
  target_pose.orientation.y = 1.0;
  target_pose.orientation.z = 0.0;
  target_pose.orientation.w = 0.0;

  // Get current robot state or use seed
  moveit::core::RobotStatePtr robot_state = move_group.getCurrentState(10.0);
  if (!robot_state) {
    std::cerr << "Could not get current state" << std::endl;
    return std::nullopt;
  }

  const moveit::core::JointModelGroup* jmg = robot_state->getJointModelGroup("arm_group");
  const std::vector<std::string>& joint_names = jmg->getVariableNames();

  // Set seed state if provided
  if (seed_state) {
    robot_state->setJointGroupPositions(jmg, *seed_state);
    std::cout << "Using previous IK solution as seed state" << std::endl;
  }

  // Compute IK solution with a small timeout to allow the solver to iterate
  // This reduces flakiness compared to the default 0.0s timeout
  bool found_ik = robot_state->setFromIK(jmg, target_pose, 0.2);
  std::cout << "IK result: " << (found_ik ? "FOUND" : "NOT FOUND") << std::endl;
  
  if (found_ik) {
    std::vector<double> joint_values;
    robot_state->copyJointGroupPositions(jmg, joint_values);
    std::cout << "IK solution joint values:" << std::endl;
    for (size_t i = 0; i < joint_names.size(); ++i) {
      std::cout << "  " << joint_names[i] << ": " << joint_values[i] << std::endl;
    }
    return joint_values;
  }

  return std::nullopt;
}

// Plan and execute a joint-space motion to the provided joint values
// Returns true if planning and execution succeed
// Removed separate executeIK to keep logic in computeIK as requested

// Main node class that handles subscriptions
class GraphIKNode : public rclcpp::Node {
public:
  GraphIKNode() : Node("graph_ik_main_node") {
    // Create separate node for MoveGroupInterface
    moveit_node_ = std::make_shared<rclcpp::Node>("graph_ik_moveit_node");
    
    // Create executor for MoveIt node and spin in background thread
    moveit_executor_ = std::make_shared<rclcpp::executors::SingleThreadedExecutor>();
    moveit_executor_->add_node(moveit_node_);
    moveit_thread_ = std::thread([this]() {
      RCLCPP_INFO(this->get_logger(), "MoveIt executor thread started");
      moveit_executor_->spin();
    });

    // Initialize MoveGroupInterface with separate node
    move_group_ = std::make_shared<moveit::planning_interface::MoveGroupInterface>(
        moveit_node_, "arm_group");
    RCLCPP_INFO(this->get_logger(), "MoveGroupInterface initialized");

  // Publisher for ordered joint states (JSON string of arrays)
  joints_pub_ = this->create_publisher<std_msgs::msg::String>("/ordered_jointstates", 10);

    // Create subscription for ordered points
    subscription_ = this->create_subscription<std_msgs::msg::String>(
      "/ordered_points", 10,
      std::bind(&GraphIKNode::pointsCallback, this, std::placeholders::_1));
    
    RCLCPP_INFO(this->get_logger(), "Ready! Waiting for messages on /ordered_points...");
  }

  ~GraphIKNode() {
    moveit_executor_->cancel();
    if (moveit_thread_.joinable()) {
      moveit_thread_.join();
    }
  }

private:
  void pointsCallback(const std_msgs::msg::String::SharedPtr msg) {
    RCLCPP_INFO(this->get_logger(), "Received points message");

    auto points = parsePoints(msg->data);
    if (points.empty()) {
      RCLCPP_ERROR(this->get_logger(), "No valid points in message");
      return;
    }

    RCLCPP_INFO(this->get_logger(), "Processing %zu point(s)", points.size());
    
    std::optional<std::vector<double>> previous_solution;
    std::vector<std::vector<double>> solutions;
    for (size_t i = 0; i < points.size(); ++i) {
      auto solution = computeIK(*move_group_, points[i], previous_solution);
      
      if (!solution) {
        if (i == 0) {
          RCLCPP_ERROR(this->get_logger(), 
            "IK FAILED for first point [%.3f, %.3f, %.3f]", 
            points[i][0], points[i][1], points[i][2]);
        } else {
          RCLCPP_ERROR(this->get_logger(), 
            "IK FAILED on transition from point %zu [%.3f, %.3f, %.3f] to point %zu [%.3f, %.3f, %.3f]",
            i, points[i-1][0], points[i-1][1], points[i-1][2],
            i+1, points[i][0], points[i][1], points[i][2]);
        }
        RCLCPP_ERROR(this->get_logger(), "Exiting due to IK failure.");
        return;
      }
      
      // Use this solution as seed for next point
      previous_solution = solution;
      solutions.push_back(*solution);
    }
    
    // Publish the full ordered joint states as JSON string
    json j = solutions;
    std_msgs::msg::String out;
    out.data = j.dump();
    joints_pub_->publish(out);
    
    RCLCPP_INFO(this->get_logger(), "✓ Published %zu ordered joint states to /ordered_jointstates", solutions.size());
  }

  rclcpp::Node::SharedPtr moveit_node_;
  std::shared_ptr<rclcpp::executors::SingleThreadedExecutor> moveit_executor_;
  std::thread moveit_thread_;
  std::shared_ptr<moveit::planning_interface::MoveGroupInterface> move_group_;
  rclcpp::Subscription<std_msgs::msg::String>::SharedPtr subscription_;
  rclcpp::Publisher<std_msgs::msg::String>::SharedPtr joints_pub_;
};

int main(int argc, char** argv) {
  rclcpp::init(argc, argv);
  auto node = std::make_shared<GraphIKNode>();
  rclcpp::spin(node);
  rclcpp::shutdown();
  return 0;
}
