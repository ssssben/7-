import rclpy
from rclpy.node import Node
from std_msgs.msg import Int16

class Listener(Node):
    def __init__(self):
        super().__init__("listener")
        self.sub = self.create_subscription(Int16, "countup", self.cb, 10)
    def cb(self, msg):
            received_value = msg.data
            multiplied = received_value * 7
            self.get_logger().info(f"7倍した結果: {multiplied} (7x{received_value})")

def main():
    rclpy.init()
    node = Listener()
    rclpy.spin(node)
