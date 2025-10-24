#include <rclcpp/rclcpp.hpp>
#include <moveit/move_group_interface/move_group_interface.h>
#include <std_msgs/msg/string.hpp>
#include <nlohmann/json.hpp>
#include <vector>
#include <moveit/robot_state/robot_state.h>
#include <atomic>
#include <iostream>

using json = nlohmann::json;

int main(int argc, char** argv)
{
  // Initialize ROS2 system and create ROS2 node
  rclcpp::init(argc, argv);
  auto node = rclcpp::Node::make_shared("traj_scripts");

  // Initialize MoveGroupInterface for the specified planning group
  moveit::planning_interface::MoveGroupInterface move_group(node, "arm_group");

  // Storage for received joint states and flag. Used atomic for thread safety
  std::vector<std::vector<double>> joint_states;
  std::atomic<bool> joint_states_received{false};

  // Subscribe to ordered joint states topic
  auto joint_states_sub = node->create_subscription<std_msgs::msg::String>(
    "/ordered_jointstates", 10,
    [&joint_states, &joint_states_received](const std_msgs::msg::String::SharedPtr msg) {
      try {
        json j = json::parse(msg->data);
        joint_states.clear();
        for (const auto& joint_array : j) {
          std::vector<double> joints;
          for (const auto& val : joint_array) {
            joints.push_back(val);
          }
          joint_states.push_back(joints);
        }
        std::cout << "Received " << joint_states.size() << " joint states" << std::endl;
        joint_states_received = true;
      } catch (const std::exception& e) {
        std::cerr << "ERROR: Failed to parse joint states JSON: " << e.what() << std::endl;
      }
    });

  std::cout << "Waiting for joint states on topic /ordered_jointstates..." << std::endl;
  std::cout << "Publish a std_msgs/String (JSON array of joint arrays) to start trajectory execution." << std::endl;

  // Spin until joint states are received
  while (rclcpp::ok() && !joint_states_received) {
    rclcpp::spin_some(node);
    std::this_thread::sleep_for(std::chrono::milliseconds(100));
  }

  if (joint_states.empty()) {
    std::cerr << "ERROR: No joint states received or empty joint state list!" << std::endl;
    return 1;
  }

  std::cout << "Starting trajectory validation for " << joint_states.size() << " joint states..." << std::endl;

  // Get robot model and joint group
  auto robot_model = move_group.getRobotModel();
  auto joint_model_group = robot_model->getJointModelGroup(move_group.getName());

  // Validate all trajectories first
  std::vector<moveit::planning_interface::MoveGroupInterface::Plan> plans;
  std::vector<std::pair<size_t, size_t>> failed_segments;

  for (size_t i = 0; i < joint_states.size(); ++i) {
    // Set start state for planning
    if (i > 0) {
      moveit::core::RobotState start_state(robot_model);
      start_state.setJointGroupPositions(joint_model_group, joint_states[i-1]);
      start_state.update();
      move_group.setStartState(start_state);
    } else {
      move_group.setStartStateToCurrentState();
    }

    // Set goal joint state
    move_group.setJointValueTarget(joint_states[i]);

    // Plan trajectory
    moveit::planning_interface::MoveGroupInterface::Plan plan;
    auto result = move_group.plan(plan);
    
    if (result == moveit::core::MoveItErrorCode::SUCCESS) {
      std::cout << "✓ Plan " << (i > 0 ? i : 0) << " → " << (i+1) << " successful" << std::endl;
      plans.push_back(plan);
    } else {
      std::cerr << "✗ Plan " << (i > 0 ? i : 0) << " → " << (i+1) << " FAILED" << std::endl;
      failed_segments.push_back({i > 0 ? i : 0, i+1});
    }
  }

  // Check if any trajectories failed
  if (!failed_segments.empty()) {
    std::cerr << "\nERROR: The following trajectory segments failed planning:" << std::endl;
    for (const auto& seg : failed_segments) {
      std::cerr << "  - Failed between joint state " << seg.first << " and " << seg.second << std::endl;
    }
    std::cerr << "Execution aborted due to planning failures." << std::endl;
    rclcpp::shutdown();
    return 1;
  }

  std::cout << "\n✓ All trajectories validated successfully!" << std::endl;
  std::cout << "Starting sequential execution...\n" << std::endl;

  // Execute all plans sequentially
  for (size_t i = 0; i < plans.size(); ++i) {
    std::cout << "Executing trajectory to joint state " << (i + 1) << "..." << std::endl;
    auto result = move_group.execute(plans[i]);
    if (result != moveit::core::MoveItErrorCode::SUCCESS) {
      std::cerr << "ERROR: Execution failed for joint state " << (i + 1) << std::endl;
      return 1;
    }
    std::cout << "✓ Reached joint state " << (i + 1) << std::endl;
    rclcpp::sleep_for(std::chrono::milliseconds(500));
  }

  std::cout << "\n✓ Successfully completed all joint states!" << std::endl;
  rclcpp::shutdown();
  return 0;
}
