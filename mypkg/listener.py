import rclpy
from rclpy.node import Node
from std_msgs.msg import Int16

class Listener(Node):
    def __init__(self):
        super().__init__("listener")
        self.sub = self.create_subscription(Int16, "countup", self.cb, 10)
    def cb(self,msg):
            multiplied = msg.data * 7
            self.get_logger().info(f"7倍した結果: {multiplied}")

def main():
    rclpy.init()
    node = Listener()
    rclpy.spin(node)
