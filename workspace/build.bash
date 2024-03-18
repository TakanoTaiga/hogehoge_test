#!/bin/bash
DISTRO=${1:-"humble"}
REPOS=${2:-"core1_2024auto.repos"}
CLEANUP=${3:-false}
REPOS_DIR=${4:-"/repos"}

SCRIPT_DIR=`realpath $(dirname "$0")`
cd ${SCRIPT_DIR}

if [ ${CLEANUP} = true ]; then
    rm -rf ${SCRIPT_DIR}/build ${SCRIPT_DIR}/install ${SCRIPT_DIR}/log ${SCRIPT_DIR}/src
fi
mkdir -p ${SCRIPT_DIR}/src/

source /opt/ros/${DISTRO}/setup.bash
# vcs import ${SCRIPT_DIR}/src/ < ${REPOS_DIR}/${REPOS}
apt update
rosdep install -i --from-paths ${SCRIPT_DIR}/src/

colcon build
