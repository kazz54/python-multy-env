#!/bin/bash

# Install CMake if not already installed
if ! command -v cmake &> /dev/null; then
    apt-get update
    apt-get install -y --no-install-recommends wget gnupg
    wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | apt-key add -
    apt-add-repository "deb https://apt.kitware.com/ubuntu/ $(lsb_release -cs) main"
    apt-get update
    apt-get install -y cmake
fi

# Install additional dependencies if needed
apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        libssl-dev \
        zlib1g-dev \
        libbz2-dev \
        libreadline-dev \
        libsqlite3-dev \
        llvm \
        libncurses5-dev \
        libncursesw5-dev \
        xz-utils \
        tk-dev \
        libffi-dev

# Start an interactive bash shell
exec /bin/bash
