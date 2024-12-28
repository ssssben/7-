#!/bin/bash

dir=~
[ "$1" != "" ] && dir="$1"

cd $dir/ros2_7times_ws
colcon build
source $dir/.bashrc
timeout 10 ros2 launch mypkg talk_listen.launch.py > /tmp/mypkg.log

cat /tmp/mypkg.log |
grep '7倍した結果'
