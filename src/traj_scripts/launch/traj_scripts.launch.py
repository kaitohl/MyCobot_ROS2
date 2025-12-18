from moveit_configs_utils import MoveItConfigsBuilder
from launch import LaunchDescription
from launch.actions import SetLaunchConfiguration, DeclareLaunchArgument, TimerAction, ExecuteProcess
from launch.substitutions import PathJoinSubstitution, Command
from launch_ros.actions import Node
from launch_ros.substitutions import FindPackageShare
from launch_ros.parameter_descriptions import ParameterValue
from pathlib import Path
from moveit_configs_utils.launches import generate_demo_launch

def generate_launch_description():
    moveit_config = MoveItConfigsBuilder(
        "firefighter",
        package_name="mycobot_280_moveit2"
    ).to_moveit_configs()

    ld = LaunchDescription()

    # Set launch argument "use_rviz" to false to disable RViz in the demo launch
    # ld.add_action(SetLaunchConfiguration("use_rviz", "true"))
    # ld.add_action(SetLaunchConfiguration("use_move_group", "false"))

    # Crete demo launch
    demo_ld = generate_demo_launch(moveit_config)
    for a in demo_ld.entities:
        ld.add_action(a)

    # Ghost robot state publisher and trajectory replayer
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

    ghost_robot_description = {
        "robot_description": ParameterValue(
            Command(["cat ", ghosturdf_file]),
            value_type=str
        )
    }

    ghost_rsp = Node(
        package='robot_state_publisher',
        executable='robot_state_publisher',
        namespace='ghost',
        output='screen',
        parameters=[ghost_robot_description],
        remappings=[('/joint_states', '/ghost/joint_states')]
    )

    ghost_py = Node(
        package="traj_scripts",
        executable="ghost.py",
        name="ghost_home",
        namespace="ghost",
        output="screen"
    )

    # Graph IK node - generates multiple IK solutions per target point
    graph_ik_node = Node(
        package='traj_scripts',
        executable='graph_ik_node',
        name='graph_ik_node',
        output='screen',
        parameters=[
            moveit_config.robot_description,
            moveit_config.robot_description_semantic,
            moveit_config.robot_description_kinematics,
        ]
    )

    # Add the trajectory runner node to run with MoveIt config loaded
    traj_runner = Node(
        package='traj_scripts',
        executable='traj_runner_node',
        name='traj_runner_node',
        output='screen',
        parameters=[
            moveit_config.robot_description,
            moveit_config.robot_description_semantic,
            moveit_config.robot_description_kinematics,
        ]
    )

    # IK node (single-pose inverse kinematics publishing joint values)
    ik_node = Node(
        package='traj_scripts',
        executable='ik_node',
        name='ik_node',
        output='screen',
        parameters=[
            moveit_config.robot_description,
            moveit_config.robot_description_semantic,
            moveit_config.robot_description_kinematics,
        ]
    )

    ld.add_action(ghost_rsp)
    ld.add_action(ghost_py)
    ld.add_action(graph_ik_node)
    ld.add_action(traj_runner)
    ld.add_action(ik_node)

    return ld
