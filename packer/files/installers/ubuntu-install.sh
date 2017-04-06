#!/bin/bash

set -e

echo "Updating package info..."
sudo apt-get update -y -qq

echo "Upgrading packages..."
sudo apt-get dist-upgrade -y -qq

echo "Install Python..."
sudo apt-get install python -y -qq
sudo apt-get install python-software-properties -y -qq
sudo apt-get install python-setuptools -y -qq
sudo apt-get install python-pip -y -qq

echo "Install unzip..."
sudo apt-get install unzip -y -qq

echo "Install Git..."
sudo apt-get install git -y -qq

echo "Install libssl"
sudo apt-get install libssl-dev -y -qq

echo "Install ansible..."
sudo apt-get install ansible -y -qq
pip install ansible -q
