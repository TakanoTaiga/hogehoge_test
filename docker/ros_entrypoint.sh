#!/bin/bash
ROS_DISTRO=${1:-"humble"}
export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
source /opt/ros/${ROS_DISTRO}/setup.bash
source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash