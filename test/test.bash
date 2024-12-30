#!/bin/bash
# SPDX-FileCopyrightText: 2024 Ben
# SPDX-License-Identifier: BSD-3-Clause
source /opt/ros/$ROS_DISTRO/setup.bash
source install/setup.bash

ros2 run charge_pkg battery_talker &
TALKER_PID=$!

sleep 5

if ros2 topic echo /battery_status --once > /dev/null 2>&1; then
  echo "Test passed: Battery status published successfully."
  kill $TALKER_PID
  exit 0
else
  echo "Test failed: Battery status not published."
  kill $TALKER_PID
  exit 1
fi
