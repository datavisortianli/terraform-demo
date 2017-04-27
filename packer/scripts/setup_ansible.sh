#!/bin/bash

set -e

echo "Updating package info..."
sudo yum update -y -q

echo "Install epel-release"
sudo yum install epel-release -y -q

echo "Install Python..."
sudo yum install python -y -q
sudo yum install python-devel -y -q
sudo yum install python-setuptools -y -q
sudo yum install python-pip -y -q

echo "Install Git..."
sudo yum install git -y -q

# echo "Install libssl"
# sudo apt-get install libssl-dev -y -q

echo "Install ansible..."
sudo yum install ansible -y -q
sudo pip install ansible -q
