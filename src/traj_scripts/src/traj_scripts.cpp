#include <rclcpp/rclcpp.hpp>
#include <moveit/move_group_interface/move_group_interface.h>
#include <geometry_msgs/msg/pose_stamped.hpp>

int main(int argc, char** argv)
{
  rclcpp::init(argc, argv);
  auto node = rclcpp::Node::make_shared("traj_scripts");

  // Give ROS 2 a moment to start up and find the MoveIt  pipeline & controllers
  rclcpp::sleep_for(std::chrono::seconds(2));

  // Replace "arm" with your MoveIt planning group name (check your SRDF)
  moveit::planning_interface::MoveGroupInterface move_group(node, "arm_group");

  // 1) Build a stamped goal pose
  geometry_msgs::msg::PoseStamped target_pose;
  target_pose.header.frame_id = move_group.getPlanningFrame();
  target_pose.header.stamp = node->now();
  target_pose.pose.position.x = 0.2;
  target_pose.pose.position.y = 0.0;
  target_pose.pose.position.z = 0.3;
  target_pose.pose.orientation.w = 1.0;

  // 2) Give it to MoveIt
  move_group.setPoseTarget(target_pose);

  // 3) Plan
  moveit::planning_interface::MoveGroupInterface::Plan my_plan;
  auto ok = (move_group.plan(my_plan) 
             == moveit::core::MoveItErrorCode::SUCCESS);
  if (!ok) {
    RCLCPP_ERROR(node->get_logger(), "Planning failed");
    return 1;
  }

  // 4) Execute
  ok = (move_group.execute(my_plan) 
        == moveit::core::MoveItErrorCode::SUCCESS);
  if (!ok) {
    RCLCPP_ERROR(node->get_logger(), "Execution failed");
    return 1;
  }

  RCLCPP_INFO(node->get_logger(), "Motion succeeded!");
  rclcpp::shutdown();
  return 0;
}
