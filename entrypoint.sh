#!/bin/bash
set -e
ln /dev/null /dev/raw1394
#source "/opt/ros/indigo/setup.bash"
exec "$@"
