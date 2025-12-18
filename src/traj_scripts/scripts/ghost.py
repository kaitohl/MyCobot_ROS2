#!/usr/bin/env python3

import rclpy
from rclpy.node import Node
from sensor_msgs.msg import JointState
import time

class GhostHomePublisher(Node):
    def __init__(self):
        super().__init__('ghost_home_publisher')

        # Publisher to joint_states (relative topic, namespace will prepend /ghost)
        self.publisher = self.create_publisher(
            JointState,
            'joint_states',
            10,
        )

        # Subscriber to the same topic to detect when others are publishing
        self.sub = self.create_subscription(
            JointState,
            'joint_states',
            self.on_message,
            10
        )

        self.ghost_names = [
            'joint2_to_joint1_ghost',
            'joint3_to_joint2_ghost',
            'joint4_to_joint3_ghost',
            'joint5_to_joint4_ghost',
            'joint6_to_joint5_ghost',
            'joint6output_to_joint6_ghost',
        ]

        self.other_publisher_detected = False
        self.last_message_time = time.time()
        self.timer = self.create_timer(0.1, self.publish_if_idle)

        self.get_logger().info("🟢 GhostHomePublisher: publishing zeros until another source takes over")

    def on_message(self, msg: JointState):
        # Only stop if we receive a non-zero message (real joint states from another source)
        # Ignore our own zero messages
        if not self.other_publisher_detected and msg.position:
            if any(abs(pos) > 0.001 for pos in msg.position):  # Check if any joint is non-zero
                self.other_publisher_detected = True
                self.get_logger().info("✅ Detected external non-zero joint state. Stopping and exiting.")
                self.timer.cancel()
                # Shutdown the node so it stops running
                rclpy.shutdown()

    def publish_if_idle(self):
        if self.other_publisher_detected:
            return

        js = JointState()
        js.header.stamp = self.get_clock().now().to_msg()
        js.name = self.ghost_names
        js.position = [0.0] * len(self.ghost_names)
        self.publisher.publish(js)

def main(args=None):
    rclpy.init(args=args)
    node = GhostHomePublisher()
    rclpy.spin(node)

if __name__ == '__main__':
    main()