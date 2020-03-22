#!/usr/bin/env sh

cd ~/catkin_ws
mkdir -p src
cd src

git clone https://github.com/gnlpfjh/turtlebot.git
git clone https://github.com/turtlebot/turtlebot_msgs.git
git clone https://github.com/turtlebot/turtlebot_apps.git
git clone https://github.com/turtlebot/turtlebot_simulator
git clone https://github.com/turtlebot/turtlebot_create.git
git clone https://github.com/turtlebot/turtlebot_interactions.git
git clone https://github.com/turtlebot/turtlebot_create_desktop.git
git clone https://github.com/turtlebot/turtlebot_rcommander.git

git clone https://github.com/toeklk/orocos-bayesian-filtering.git
cd orocos-bayesian-filtering/orocos_bfl/
./configure
make
sudo make install
cd ../
make
cd ../

git clone https://github.com/udacity/robot_pose_ekf
git clone https://github.com/ros-perception/depthimage_to_laserscan.git

git clone https://github.com/yujinrobot/yujin_ocs.git
mv yujin_ocs/yocs_cmd_vel_mux yujin_ocs/yocs_controllers .
rm -rf yujin_ocs

cd ~
git clone https://github.com/OpenKinect/libfreenect2.git
cd libfreenect2
sudo apt-get install build-essential cmake pkg-config -y
sudo apt-get install libusb-1.0-0-dev -y
sudo apt-get install libturbojpeg0-dev -y
sudo apt-get install libglfw3-dev -y
sudo apt-get install libopenni2-dev -y

sudo add-apt-repository ppa:floe/beignet && sudo apt-get update
sudo apt-get install beignet beignet-dev opencl-headers -y
mkdir build && cd build
cmake .. -DENABLE_CXX11=ON -DCMAKE_INSTALL_PREFIX=$HOME/freenect2
make
make install
sudo cp ../platform/linux/udev/90-kinect2.rules /etc/udev/rules.d/
sudo apt-get install openni2-utils -y && sudo make install-openni2
export LIBFREENECT2_PIPELINE=cl

sudo apt-get install ros-melodic-kobuki-* -y
sudo apt-get install ros-melodic-ecl-streams -y
sudo apt-get install ros-melodic-joy -y
sudo apt install ros-melodic-laptop-battery-monitor -y
sudo apt install ros-melodic-robot-pose-ekf -y
sudo apt install ros-melodic-opnni2-* -y
sudo apt install libeigen3-dev -y
sudo apt install libpcl-dev -y

cd ~/catkin_ws
git clone https://github.com/code-iai/iai_kinect2.git
cd iai_kinect2
rosdep install -r --from-paths .
cd ~/catkin_ws
catkin_make -DCMAKE_BUILD_TYPE="Release"
