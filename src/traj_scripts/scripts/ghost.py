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

        self.publisher = self.create_publisher(JointState, 'ghost_joint_states', 10)
        self.subscription = self.create_subscription(
            DisplayTrajectory,
            '/display_planned_path',
            self.trajectory_callback,
            10
        )

        self.joint_names = []
        self.trajectory_points = []
        self.current_index = 0
        self.start_time = None

        self.loop_timer = self.create_timer(0.01, self.replay_trajectory_loop)

        self.get_logger().info("🟢 GhostPublisher started. Waiting for a trajectory...")

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

        # 🟢 Immediately publish the first joint state so the ghost robot appears properly in Slicer
        pt = self.trajectory_points[0]
        initial_js = JointState()
        initial_js.name = [name + "_ghost" for name in self.joint_names]
        initial_js.position = list(pt.positions)
        initial_js.velocity = list(pt.velocities) if pt.velocities else []
        initial_js.effort = list(pt.effort) if pt.effort else []
        initial_js.header.stamp = self.get_clock().now().to_msg()

        self.publisher.publish(initial_js)
        self.get_logger().info("👻 Initial ghost pose published.")


    def replay_trajectory_loop(self):
        if not self.trajectory_points:
            return  # No trajectory loaded yet

        now = time.time() - self.start_time

        while self.current_index < len(self.trajectory_points):
            pt = self.trajectory_points[self.current_index]
            target_time = pt.time_from_start.sec + pt.time_from_start.nanosec / 1e9

            if now < target_time:
                return  # Wait for the right time

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
