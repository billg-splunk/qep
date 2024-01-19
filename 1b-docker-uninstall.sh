#!/bin/bash

# This script was created because there seems to be a change to docker to
# cause issues when importing into k3s. The version supplied seems to work.

sudo apt-get purge -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras

echo ""
echo ""
echo ""
echo Docker uninstalled
