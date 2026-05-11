#!/bin/bash
set -euo pipefail

if [ "$PWD" = "/" ]; then
    echo "Error: No working directory set. Please set a WORKDIR in your Dockerfile before running this script."
    exit 1
fi

export PIP_FIND_LINKS="${PIP_FIND_LINKS:-/opt/wheelhouse}"
export PIP_INDEX_URL="${PIP_INDEX_URL:-https://pypi.tuna.tsinghua.edu.cn/simple}"
export UV_FIND_LINKS="${UV_FIND_LINKS:-/opt/wheelhouse}"
export UV_DEFAULT_INDEX="${UV_DEFAULT_INDEX:-https://pypi.tuna.tsinghua.edu.cn/simple}"

if ! command -v uv >/dev/null 2>&1; then
    python3 -m pip install --find-links="$PIP_FIND_LINKS" uv || python3 -m pip install uv
fi

if [ ! -f pyproject.toml ]; then
    uv init --bare >/dev/null 2>&1 || uv init
fi

uv add pytest
