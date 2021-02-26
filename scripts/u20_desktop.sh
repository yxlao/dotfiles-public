#!/usr/bin/env bash

set -eu

SCRIPT=$(readlink -f "$0")
PWD=$(dirname "$SCRIPT")

${PWD}/u20_server.sh

sudo apt install -y \
    filezilla \
    vlc \
    gimp \
    gparted \
    ubuntu-restricted-extras \
    gnome-tweaks \
    ibus-pinyin \
    pinyin-database \
    gnome-shell-extensions \
    gnome-shell-extension-prefs \
    gnome-shell-extension-system-monitor \
    lm-sensors \
    dconf-editor \
    smartmontools
