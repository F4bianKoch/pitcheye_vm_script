#!/bin/bash
# setup.sh - Script to initialize environment on fresh VM boot

set -e

# Update package lists
apt-get update

# Install essential packages
apt-get install -y \
    curl \
    wget \
    git \
    vim \
    htop \
    build-essential \
    libgl1 \
    software-properties-common

# Install Python 3.13
add-apt-repository ppa:deadsnakes/ppa -y
apt-get update
apt-get install -y python3.13 python3.13-venv python3.13-dev

# Install Poetry
curl -sSL https://install.python-poetry.org | python3 -
echo \'export PATH="/root/.local/bin:$PATH"\' >> ~/.bashrc
source ~/.bashrc

# Clone your repositories if needed
git clone https://$GITHUB_USER:$GITHUB_TOKEN@github.com/f4biankoch/pitcheye.git ~
