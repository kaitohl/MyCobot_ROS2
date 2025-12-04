#!/usr/bin/env python3

import rclpy
from rclpy.node import Node
from sensor_msgs.msg import JointState

class GhostHomePublisher(Node):
    def __init__(self):
        super().__init__('ghost_home_publisher')

        # Publisher to ghost_joint_states (namespace will prepend automatically)
        self.publisher = self.create_publisher(
            JointState,
            'ghost_joint_states',
            10,
        )

        # Publish once after a short intro delay (to allow ghost RSP to start)
        self.timer = self.create_timer(0.2, self.publish_once)

        self.has_published = False
        self.get_logger().info("🟢 GhostHomePublisher: will publish one-time home pose.")

    def publish_once(self):
        if self.has_published:
            return

        js = JointState()
        js.header.stamp = self.get_clock().now().to_msg()

        # Your ghost joint names (non-ghost names also fine)
        js.name = [
            'joint2_to_joint1_ghost',
            'joint3_to_joint2_ghost',
            'joint4_to_joint3_ghost',
            'joint5_to_joint4_ghost',
            'joint6_to_joint5_ghost',
            'joint6output_to_joint6_ghost',
        ]
        js.position = [0.0] * len(js.name)

        self.publisher.publish(js)
        self.get_logger().info("✅ GhostHomePublisher: Published home joint_state once.")

        self.has_published = True

        # Shut down this node cleanly after publishing once
        self.destroy_timer(self.timer)
        self.get_logger().info("🔻 GhostHomePublisher: shutting down.")
        rclpy.shutdown()

def main(args=None):
    rclpy.init(args=args)
    node = GhostHomePublisher()
    rclpy.spin(node)

if __name__ == '__main__':
    main()
