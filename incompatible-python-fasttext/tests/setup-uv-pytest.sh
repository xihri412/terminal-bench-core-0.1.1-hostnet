#!/bin/bash

# Install curl and uv
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
