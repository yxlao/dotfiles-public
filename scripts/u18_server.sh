#!/usr/bin/env bash

set -eu

sudo apt update

sudo apt upgrade -y

sudo apt install -y \
    axel \
    build-essential \
    ccache \
    clang \
    cmake \
    curl \
    g++ \
    git \
    htop \
    openssh-server \
    p7zip-full \
    python-dev \
    python-virtualenv \
    python3-dev \
    tmux \
    vim \
    zsh
