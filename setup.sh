#!/bin/bash
# setup.sh - Script to initialize environment on fresh VM boot

set -e
echo "Starting VM initialization..."

# Update package lists
echo "Updating package lists..."
apt-get update

# Install essential packages (customize as needed)
echo "Installing required packages..."
apt-get install -y \
    curl \
    wget \
    git \
    vim \
    htop \
    build-essential \
    software-properties-common

# Install Python 3.13
echo "Installing Python 3.13..."
add-apt-repository ppa:deadsnakes/ppa -y
apt-get update
apt-get install -y python3.13 python3.13-venv python3.13-dev

# Install Poetry
echo "Installing Poetry..."
curl -sSL https://install.python-poetry.org | python3 -
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

# Install specific software
echo "Installing Docker..."
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

# Clone your repositories if needed
git clone https://github.com/f4biankoch/pitcheye.git

echo "VM initialization complete!"
