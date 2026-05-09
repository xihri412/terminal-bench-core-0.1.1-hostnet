#!/bin/bash

# Install uv from domestic mirrors
if [ -f /etc/apt/sources.list.d/debian.sources ]; then
    sed -i 's|http://deb.debian.org/debian|https://mirrors.tuna.tsinghua.edu.cn/debian|g; s|http://security.debian.org/debian-security|https://mirrors.tuna.tsinghua.edu.cn/debian-security|g' /etc/apt/sources.list.d/debian.sources
elif [ -f /etc/apt/sources.list ]; then
    sed -i 's|http://deb.debian.org/debian|https://mirrors.tuna.tsinghua.edu.cn/debian|g; s|http://security.debian.org/debian-security|https://mirrors.tuna.tsinghua.edu.cn/debian-security|g; s|http://archive.ubuntu.com/ubuntu|https://mirrors.tuna.tsinghua.edu.cn/ubuntu|g; s|http://security.ubuntu.com/ubuntu|https://mirrors.tuna.tsinghua.edu.cn/ubuntu|g' /etc/apt/sources.list
fi
apt-get update
apt-get install -y curl python3-pip

python3 -m pip install --break-system-packages -i https://pypi.tuna.tsinghua.edu.cn/simple uv || \
    python3 -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple uv
export UV_DEFAULT_INDEX=https://pypi.tuna.tsinghua.edu.cn/simple

# Check if we're in a valid working directory
if [ "$PWD" = "/" ]; then
    echo "Error: No working directory set. Please set a WORKDIR in your Dockerfile before running this script."
    exit 1
fi

uv init
uv add pytest
