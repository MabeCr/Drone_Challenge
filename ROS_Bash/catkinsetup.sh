#!/bin/bash
set -e
YELLOW='\033[1;33m' # For yellow output
GREEN='\033[0;32m'  # For green output
NC='\033[0m'        # For resetting the output color

echo -e "${YELLOW}Starting Bebop Autonomy Setup${NC}"
echo -e "${YELLOW}Creating Bebop Autonomy workspace directory:${NC}"
sleep 1
mkdir -p ~/bebop_ws/src
cd ~/bebop_ws
echo -e "${GREEN}Successfully created Bebop Autonomy workspace directory${NC}"
echo -e "${YELLOW}Performing Catkin Init:${NC}"
sleep 2
catkin init --workspace ~/bebop_ws
echo -e "${GREEN}Successfully performed catkin init${NC}"
echo -e "${YELLOW}Cloning Bebop Autonomy from Github:${NC}"
git clone https://github.com/AutonomyLab/bebop_autonomy.git src/bebop_autonomy
echo -e "${GREEN}Successfully cloned Bebop Autonomy from github${NC}"
echo -e "${YELLOW}Performing Rosdep Update:${NC}"
sleep 2
sudo apt-get update
rosdep update
echo -e "${GREEN}Successfully performed rosdep update${NC}"
echo -e "${YELLOW}Performing Rosdep Install:${NC}"
sleep 2
rosdep install -y --from-paths src -i
echo -e "${GREEN}Successfully performed  rosdep install${NC}"
echo -e "${YELLOW}Performing Catkin Build:${NC}"
sleep 2
catkin build -DCMAKE_BUILD_TYPE=RelWithDebInfo
echo -e "${GREEN}Successfully built catkin workspace${NC}"
cd ~/bebop_ws/devel
echo -e "${YELLOW}Sourcing Bebop Autonomy Setup.bash:${NC}"
sleep 2
echo "source ~/bebop_ws/devel/setup.bash" >> ~/.bashrc
source ~/.bashrc
echo -e "${GREEN}Successfully sourced setup.bash${NC}"
bash
cd /
echo -e "${GREEN}Script was successful${NC}"
