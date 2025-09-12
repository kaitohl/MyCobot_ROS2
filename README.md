# MyCobot_ROS2

This repository contains scripts to launch nodes to vizualize planning in 3D Slicer. Currently planning and excution are based off of a MyCobot 280 M5 robot in rviz.

# Requirements
- SlicerROS2

# Running the code
**Step 1:** Clone the repo into a workspace folder. We will use `ros2_ws` as our example workspace.

**Step 2:** Build the workspace and source it.
``` bash
$ cd ~/ros2_ws
$ colcon build
$ source install/setup.bash
```
**Step 3:** Run launch file
```bash
$ ros2 launch traj_scripts traj_scripts.launch.py
```
**Step 4:** In a new terminal, launch 3D Slicer and open SlicerROS2. 
``` bash
$ cd ~/Slicer-SuperBuild-Debug/Slicer-build
$ ./Slicer
```
**Step 5:** In the SlicerROS2 module, load in the default robot with the default parameters. This represents the actual robot.

**Step 6:** Load a second robot in with a different robot name, and change the "Parameter name" field to `/ghost/robot_state_publisher`. This represents the ghost robot.


# Next Steps
- Create 3D Slicer module to imitate Rviz window. Include plan and execute buttons, vizualize path,
- Allow the ability to import point clouds to represent scanning region