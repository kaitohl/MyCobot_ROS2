#!/usr/bin/env python3

import rclpy
from rclpy.node import Node
from sensor_msgs.msg import JointState
from moveit_msgs.msg import DisplayTrajectory
from builtin_interfaces.msg import Duration
import time

class GhostPublisher(Node):
    def __init__(self):
        super().__init__('ghost_trajectory_replayer')

        # Configure ghost parameters
        self.declare_parameter('ghost_publish_frequency', 100.0)
        self.declare_parameter('ghost_speedup', 2.0)  # Default to 5x speed
        self._freq = self.get_parameter('ghost_publish_frequency').get_parameter_value().double_value
        self._speedup = self.get_parameter('ghost_speedup').get_parameter_value().double_value
        
        if self._freq <= 0.0:
            self.get_logger().warn('ghost_publish_frequency must be > 0. Using 100.0 Hz.')
            self._freq = 100.0
        if self._speedup <= 0.0:
            self.get_logger().warn('ghost_speedup must be > 0. Using 2.0.')
            self._speedup = 2.0

        # Create publisher for the ghost joint states
        self.publisher = self.create_publisher(JointState, 'ghost_joint_states', 10)

        # Create subscriber to listen to /display_planned_path topic
        self.subscription = self.create_subscription(
            DisplayTrajectory,
            '/display_planned_path',
            self.trajectory_callback,
            10
        )

        # Initialize variables
        self.joint_names = []
        self.trajectory_points = []
        self.current_index = 0
        self.start_time = None

        timer_period = 1.0 / self._freq
        
        # Call the replay function at the specified frequency
        self.loop_timer = self.create_timer(timer_period, self.replay_trajectory_loop)

        self.get_logger().info(f"🟢 GhostPublisher started. Waiting for a trajectory... (publish freq: {self._freq} Hz, speedup: {self._speedup}x)")

    def trajectory_callback(self, msg):
        if not msg.trajectory or not msg.trajectory[0].joint_trajectory.points:
            self.get_logger().warn("⚠️ Empty trajectory received.")
            return

        traj = msg.trajectory[0].joint_trajectory
        self.joint_names = traj.joint_names
        self.trajectory_points = traj.points
        self.current_index = 0
        self.start_time = time.time()

        self.get_logger().info(f"📦 Received new trajectory with {len(self.trajectory_points)} points. Looping playback started.")


    def replay_trajectory_loop(self):
        
        # Check if no trajectory loaded yet, publish home position
        if not self.trajectory_points:
            home_js = JointState()
            home_js.name = ['joint2_to_joint1_ghost', 'joint3_to_joint2_ghost', 
                          'joint4_to_joint3_ghost', 'joint5_to_joint4_ghost', 
                          'joint6_to_joint5_ghost', 'joint6output_to_joint6_ghost']
            home_js.position = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
            home_js.velocity = []
            home_js.effort = []
            home_js.header.stamp = self.get_clock().now().to_msg()
            self.publisher.publish(home_js)
            return

        # Calculate current time in the trajectory
        now = (time.time() - self.start_time) * self._speedup

        # Loop through trajectory points based on elapsed time
        while self.current_index < len(self.trajectory_points):
            
            # Extract the current trajectory point and its target time
            pt = self.trajectory_points[self.current_index]
            target_time = pt.time_from_start.sec + pt.time_from_start.nanosec / 1e9
            
            # Wait for the right time
            if now < target_time:
                return  

            # Append _ghost to each joint name
            ghost_joint_names = [name + "_ghost" for name in self.joint_names]

            # Build and publish JointState
            js = JointState()
            js.name = ghost_joint_names
            js.position = list(pt.positions)
            js.velocity = list(pt.velocities) if pt.velocities else []
            js.effort = list(pt.effort) if pt.effort else []
            js.header.stamp = self.get_clock().now().to_msg()
            self.publisher.publish(js)

            # Move to the next trajectory point
            self.current_index += 1

        # Once done, loop again
        self.current_index = 0
        self.start_time = time.time()
        self.get_logger().debug("🔁 Looping trajectory")

def main(args=None):
    rclpy.init(args=args)
    node = GhostPublisher()
    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        pass
    finally:
        node.destroy_node()
        rclpy.shutdown()

if __name__ == '__main__':
    main()
