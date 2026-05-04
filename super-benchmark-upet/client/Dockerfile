FROM python:3.10-slim-bookworm
RUN if [ -f /etc/apt/sources.list.d/debian.sources ]; then \
        sed -i 's|http://deb.debian.org/debian|https://mirrors.tuna.tsinghua.edu.cn/debian|g; s|http://security.debian.org/debian-security|https://mirrors.tuna.tsinghua.edu.cn/debian-security|g' /etc/apt/sources.list.d/debian.sources; \
    elif [ -f /etc/apt/sources.list ]; then \
        sed -i 's|http://deb.debian.org/debian|https://mirrors.tuna.tsinghua.edu.cn/debian|g; s|http://security.debian.org/debian-security|https://mirrors.tuna.tsinghua.edu.cn/debian-security|g; s|http://archive.ubuntu.com/ubuntu|https://mirrors.tuna.tsinghua.edu.cn/ubuntu|g; s|http://security.ubuntu.com/ubuntu|https://mirrors.tuna.tsinghua.edu.cn/ubuntu|g' /etc/apt/sources.list; \
    fi
RUN pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

RUN apt-get update

RUN apt-get install -y \
    tmux curl asciinema git build-essential gcc cmake ccache curl wget unzip sudo libreadline-dev clang zlib1g zlib1g-dev pkg-config jupyter openjdk-17-jdk \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /app

COPY requirements.txt /app/
COPY task-deps/ /app/task-deps/
RUN mkdir -p /tmp/upetpatch \
    && tar -xzf /app/task-deps/upet-4701c3c6.tar.gz -C /tmp/upetpatch \
    && printf '%s\n' \
        'datasets==2.18.0' \
        'numpy==1.26.4' \
        'tqdm==4.67.1' \
        'transformers==4.27.4' \
        'seqeval==1.2.2' \
        'accelerate==0.20.3' \
        > /tmp/upetpatch/UPET-4701c3c62441077cc44a6553bf6ae909d99b8351/requirements.txt \
    && tar -czf /app/task-deps/upet-4701c3c6.tar.gz -C /tmp/upetpatch UPET-4701c3c62441077cc44a6553bf6ae909d99b8351 \
    && rm -rf /tmp/upetpatch
RUN pip install -r requirements.txt
