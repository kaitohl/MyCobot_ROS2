cmake_minimum_required(VERSION 3.5)
project(traj_scripts)

# Require modern C++
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# find ament and ROS 2 packages
find_package(ament_cmake REQUIRED)
find_package(ament_cmake_python REQUIRED)
find_package(rclcpp REQUIRED)
find_package(rclpy REQUIRED)
find_package(moveit_ros_planning_interface REQUIRED)
find_package(geometry_msgs REQUIRED)
find_package(moveit_msgs REQUIRED)
find_package(std_msgs REQUIRED)
find_package(tf2_eigen REQUIRED)

# build your node
add_executable(traj_runner_node src/traj_scripts.cpp)
ament_target_dependencies(traj_runner_node
  rclcpp
  moveit_ros_planning_interface
  geometry_msgs
  moveit_msgs
)

# Add graph_ik node
add_executable(graph_ik_node src/graph_ik.cpp)
ament_target_dependencies(graph_ik_node
  rclcpp
  moveit_ros_planning_interface
  std_msgs
  geometry_msgs
  tf2_eigen
)

# Add ik node
add_executable(ik_node src/ik.cpp)
ament_target_dependencies(ik_node
  rclcpp
  moveit_ros_planning_interface
  geometry_msgs
  std_msgs
  sensor_msgs
)

# install the executable
install(
  TARGETS traj_runner_node graph_ik_node ik_node
  DESTINATION lib/${PROJECT_NAME}
)


# install your Python launch files
install(
  DIRECTORY launch
  DESTINATION share/${PROJECT_NAME}
)

# Install Python modules
ament_python_install_package(${PROJECT_NAME})

# Install Python executables
install(PROGRAMS
  scripts/ghost.py
  DESTINATION lib/${PROJECT_NAME}
)

ament_package()
