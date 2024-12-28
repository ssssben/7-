#!/bin/bash

dir=~
[ "$1" != "" ] && dir="$1"

echo "Building the workspace..."
cd $dir/ros2_ws
colcon build
if [ $? -ne 0 ]; then
  echo "Colcon build failed"
  exit 1
fi

echo "Sourcing environment..."
source $dir/ros2_ws/install/setup.bash
if [ $? -ne 0 ]; then
  echo "Failed to source environment"
  exit 1
fi

echo "Running the launch file..."
timeout 10 ros2 launch mypkg talk_listen.launch.py > /tmp/mypkg.log

echo "Checking the logs for '7倍した結果'..."
cat /tmp/mypkg.log
grep '7倍した結果' /tmp/mypkg.log
if [ $? -ne 0 ]; then
  echo "'7倍した結果' not found in log"
  exit 1
fi

echo "Test completed successfully!"

