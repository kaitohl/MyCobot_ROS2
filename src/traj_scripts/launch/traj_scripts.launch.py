from moveit_configs_utils import MoveItConfigsBuilder
from launch import LaunchDescription
from launch.actions import DeclareLaunchArgument
from launch.substitutions import LaunchConfiguration, PathJoinSubstitution, Command
from launch_ros.actions import Node
from launch_ros.substitutions import FindPackageShare
from launch_ros.parameter_descriptions import ParameterValue
from launch.launch_description_sources import PythonLaunchDescriptionSource
from launch.actions import IncludeLaunchDescription
from pathlib import Path
from moveit_configs_utils.launches import generate_demo_launch

def generate_launch_description():
    
# Launch nodes for the MyCobot 280 robot with MoveIt2
    # Load MoveIt config
    moveit_config = MoveItConfigsBuilder(
        "firefighter",
        package_name="mycobot_280_moveit2"
    ).to_moveit_configs()

    # moveit_config_package_path = moveit_config.package_path
    # ld = LaunchDescription()
    ld = generate_demo_launch(moveit_config)

# Ghost robot state publisher and trajectory replayer

    # Declare ghost publish frequency (optional tuning)
    ld.add_action(DeclareLaunchArgument(
        "ghost_publish_frequency",
        default_value="100.0",
        description="Hz for ghost robot_state_publisher"
    ))

    ghosturdf_file = PathJoinSubstitution([
        FindPackageShare("mycobot_description"),
        "urdf",
        "mycobot_280_m5",
        "mycobot_280_m5_ghost.urdf"
    ])

    # Read URDF file contents at runtime
    ghost_robot_description = {
        "robot_description": ParameterValue(
            Command(["cat ", ghosturdf_file]),
            value_type=str
        )
    }
    
    # Add ghost robot_state_publisher node
    ghost_rsp = Node(
        package='robot_state_publisher',
        executable='robot_state_publisher',
        namespace='ghost',
        output='screen',
        parameters=[ghost_robot_description],
        remappings=[
            ('joint_states', 'ghost_joint_states'),
        ]
    )

    # Add ghost replay node (publishes ghost_joint_states from planned path)
    ghost_py = Node(
        package="traj_scripts",
        executable="ghost.py",
        name="ghost_trajectory_replayer",
        namespace="ghost",
        output="screen"
    )
    
    optplan = Node(
        package='traj_scripts',
        executable='plan_node',
        name='optangles_planner',
        output='screen'
    )

    # 6) Add both to the launch description
    ld.add_action(ghost_rsp)
    ld.add_action(ghost_py)
    ld.add_action(optplan)

    return ld
