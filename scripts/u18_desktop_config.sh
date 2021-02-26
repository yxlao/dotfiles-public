#!/usr/bin/env bash

set -eu

# Disable apport
sudo sed -i 's/enabled=1/enabled=0/g' /etc/default/apport
sudo systemctl disable apport