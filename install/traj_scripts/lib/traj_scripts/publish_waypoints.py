#!/usr/bin/env python3
"""
Publish example waypoints to /trajectory_waypoints topic for testing.
"""
import rclpy
from rclpy.node import Node
from geometry_msgs.msg import PoseArray, Pose
import math


def quaternion_from_euler(roll, pitch, yaw):
    """
    Convert Euler angles (roll, pitch, yaw) to quaternion (x, y, z, w).
    """
    cy = math.cos(yaw * 0.5)
    sy = math.sin(yaw * 0.5)
    cp = math.cos(pitch * 0.5)
    sp = math.sin(pitch * 0.5)
    cr = math.cos(roll * 0.5)
    sr = math.sin(roll * 0.5)

    w = cr * cp * cy + sr * sp * sy
    x = sr * cp * cy - cr * sp * sy
    y = cr * sp * cy + sr * cp * sy
    z = cr * cp * sy - sr * sp * cy

    return (x, y, z, w)


class WaypointPublisher(Node):
    def __init__(self):
        super().__init__('waypoint_publisher')
        self.publisher = self.create_publisher(PoseArray, '/trajectory_waypoints', 10)
        
        # Wait a bit for subscribers
        self.get_logger().info('Waiting 2 seconds for subscribers...')
        self.create_timer(2.0, self.publish_waypoints)
    
    def publish_waypoints(self):
        """Publish 3 example waypoints with downward-facing orientation."""
        msg = PoseArray()
        msg.header.frame_id = 'base_link'
        msg.header.stamp = self.get_clock().now().to_msg()
        
        # Downward facing orientation (180° rotation about X-axis)
        q = quaternion_from_euler(math.pi, 0.0, 0.0)
        
        # Waypoint 1
        pose1 = Pose()
        pose1.position.x = 0.2
        pose1.position.y = 0.0
        pose1.position.z = 0.2
        pose1.orientation.x = q[0]
        pose1.orientation.y = q[1]
        pose1.orientation.z = q[2]
        pose1.orientation.w = q[3]
        msg.poses.append(pose1)
        
        # Waypoint 2
        pose2 = Pose()
        pose2.position.x = 0.2
        pose2.position.y = -0.1
        pose2.position.z = 0.2
        pose2.orientation.x = q[0]
        pose2.orientation.y = q[1]
        pose2.orientation.z = q[2]
        pose2.orientation.w = q[3]
        msg.poses.append(pose2)
        
        # Waypoint 3
        pose3 = Pose()
        pose3.position.x = 0.2
        pose3.position.y = 0.1
        pose3.position.z = 0.2
        pose3.orientation.x = q[0]
        pose3.orientation.y = q[1]
        pose3.orientation.z = q[2]
        pose3.orientation.w = q[3]
        msg.poses.append(pose3)
        
        self.publisher.publish(msg)
        self.get_logger().info(f'Published {len(msg.poses)} waypoints to /trajectory_waypoints')
        
        # Shutdown after publishing
        self.get_logger().info('Shutting down publisher...')
        rclpy.shutdown()


def main(args=None):
    rclpy.init(args=args)
    node = WaypointPublisher()
    rclpy.spin(node)


if __name__ == '__main__':
    main()
