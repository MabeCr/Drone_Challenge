# I have no clue what I'm doing
FROM ubuntu:14.04.5

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8

RUN sudo apt-get -y update && sudo apt-get -y install
RUN sudo apt-get -y install nano git firefox

# Begin the ROS Indigo Installation
RUN sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
RUN sudo apt-get -y update && sudo apt-get -y install
RUN sudo apt-get install -y ros-indigo-ros-base
RUN sudo rosdep init
RUN sudo rosdep update
RUN echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc
RUN /bin/bash -c "source ~/.bashrc"
RUN sudo apt-get install -y ros-indigo-cv-bridge build-essential python-rosdep python-catkin-tools ros-indigo-web-video-server ros-indigo-robot-state-publisher

COPY ./entrypoint.sh /
COPY ./catkinsetup.sh /
ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]
