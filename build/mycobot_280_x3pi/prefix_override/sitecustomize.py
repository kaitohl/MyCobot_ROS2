import sys
if sys.prefix == '/usr':
    sys.real_prefix = sys.prefix
    sys.prefix = sys.exec_prefix = '/home/robotics/ros2_cobot/install/mycobot_280_x3pi'
