#!/usr/bin/env python3

import rclpy
from rclpy.node import Node
from std_msgs.msg import String

import json
import lkh
from pathlib import Path
import numpy as np
from python_tsp.heuristics import solve_tsp_lin_kernighan
from python_tsp.distances import tsplib_distance_matrix

class TSPPointCloudNode(Node):
    def __init__(self):
        super().__init__('tsp_pointcloud_node')
        self.subscription = self.create_subscription(
            String,
            '/pointcloud_json',
            self.pointcloud_callback,
            10
        )
        self.publisher = self.create_publisher(
            String,
            '/ordered_points',
            10
        )
        self.get_logger().info('TSP PointCloud Node started, waiting for JSON file path...')

    def pointcloud_callback(self, msg):
        json_file_path = msg.data
        self.get_logger().info(f'Received JSON file path: {json_file_path}')
        try:
            mrk_path = Path(json_file_path)
            with mrk_path.open() as f:
                data = json.load(f)
            if not data:
                self.get_logger().error('Failed to load marker data')
                return
            # Points are in markups[0].controlPoints[*].position = [x,y,z]
            pts = [tuple(cp["position"]) for cp in data["markups"][0]["controlPoints"]]
            self.get_logger().info(f"Loaded {len(pts)} points from {mrk_path}")

            # --- TSP LOGIC ---
            path_pts = Path("/tmp/path_pts.tsp")
            create_tsp_with_lkh(path_pts, "path_pts", pts)
            dm = tsplib_distance_matrix(str(path_pts))
            perm, length = solve_tsp_lin_kernighan(dm)
            # print if solver worked
            self.get_logger().info(f"TSP solved, path length: {length:.3f}")
            ordered_pts = [pts[i] for i in perm]
            # --- END TSP LOGIC ---

            # Publish the ordered points as a JSON string
            # print publishing number of points
            self.get_logger().info(f"Publishing {len(ordered_pts)} ordered points...")
            out_msg = String()
            out_msg.data = json.dumps(ordered_pts)
            self.publisher.publish(out_msg)
            self.get_logger().info(f"Published ordered points to /tsp_ordered_points")
        except Exception as e:
            self.get_logger().error(f"Error processing point cloud: {e}")


# Create TSP files using the WORKING LKH method
def create_tsp_with_lkh(filename, name, points):
    """Create TSP file using LKH library - WORKING VERSION"""
    problem = lkh.LKHProblem()
    problem.name = name
    problem.type = "TSP"  
    problem.dimension = len(points)
    problem.edge_weight_type = "EUC_3D"
    # The key: use node_coords (dict) not node_coord_section (list)
    node_coords = {}
    for i, (x, y, z) in enumerate(points, 1):
        node_coords[i] = (x, y, z)
    problem.node_coords = node_coords
    with open(filename, 'w') as f:
        f.write(problem.render())


def main(args=None):
    rclpy.init(args=args)
    node = TSPPointCloudNode()
    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        pass
    node.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()
