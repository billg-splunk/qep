#!/bin/bash

# This script was created because there seems to be a change to docker to
# cause issues when importing into k3s. The version supplied seems to work.

sudo apt-get update
VERSION_STRING=5:23.0.0-1~ubuntu.22.04~jammy
sudo apt-get install -y docker-ce=$VERSION_STRING docker-ce-cli=$VERSION_STRING containerd.io docker-buildx-plugin docker-compose-plugin

echo ""
echo ""
echo ""
echo Docker reinstalled, pinned version
echo ""
echo If you received any errors re-run this script and they should be resolved.