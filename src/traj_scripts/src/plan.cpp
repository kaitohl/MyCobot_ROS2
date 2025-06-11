#include <rclcpp/rclcpp.hpp>
#include <std_msgs/msg/float64_multi_array.hpp>
#include <moveit/move_group_interface/move_group_interface.h>

class OptAnglesPlanner : public rclcpp::Node
{
public:
  OptAnglesPlanner() : Node("opt_angles_planner")
  {
    using std::placeholders::_1;
    sub_ = this->create_subscription<std_msgs::msg::Float64MultiArray>(
      "/optangles", 10,
      std::bind(&OptAnglesPlanner::anglesCallback, this, _1));
  }

private:
  void anglesCallback(const std_msgs::msg::Float64MultiArray::SharedPtr msg)
  {
    const auto& data = msg->data;
    if (data.size() < 12) {
      RCLCPP_ERROR(this->get_logger(), "Need at least 12 values (2 joint configurations), got %zu", data.size());
      return;
    }

    std::vector<double> q_start(data.begin(), data.begin() + 6);
    std::vector<double> q_goal(data.begin() + 6, data.begin() + 12);

    // Print starting and goal configurations
    RCLCPP_INFO(this->get_logger(), "Starting configuration: [%f, %f, %f, %f, %f, %f]",
                q_start[0], q_start[1], q_start[2], q_start[3], q_start[4], q_start[5]);
                
    RCLCPP_INFO(this->get_logger(), "Goal configuration: [%f, %f, %f, %f, %f, %f]",
                q_goal[0], q_goal[1], q_goal[2], q_goal[3], q_goal[4], q_goal[5]);

    // Set up MoveIt
    static const std::string PLANNING_GROUP = "arm_group";
    moveit::planning_interface::MoveGroupInterface move_group(shared_from_this(), PLANNING_GROUP);

    move_group.setStartStateToCurrentState();
    move_group.setJointValueTarget(q_goal);

    moveit::planning_interface::MoveGroupInterface::Plan plan;
    bool success = (move_group.plan(plan) == moveit::core::MoveItErrorCode::SUCCESS);

    if (success) {
      RCLCPP_INFO(this->get_logger(), "✅ Planning succeeded! Check RViz.");
    } else {
      RCLCPP_ERROR(this->get_logger(), "❌ Planning failed.");
    }
  }
  rclcpp::Subscription<std_msgs::msg::Float64MultiArray>::SharedPtr sub_;
};

int main(int argc, char **argv)
{
  rclcpp::init(argc, argv);
  auto node = std::make_shared<OptAnglesPlanner>();
  rclcpp::spin(node);
  rclcpp::shutdown();
  return 0;
}
