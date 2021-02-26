#!/usr/bin/env bash

set -eu

SCRIPT=$(readlink -f "$0")
PWD=$(dirname "$SCRIPT")
${PWD}/u18_server.sh

sudo apt install -y \
    compizconfig-settings-manager \
    filezilla \
    gimp \
    gparted \
    indicator-multiload \
    ubuntu-restricted-extras \
    unity-tweak-tool
