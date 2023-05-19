#!/bin/bash

# This setup script will:
# (1) Remove demoinabox demos
# (2) Stop the demoinabox frontend

# General variables
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

# (1) Remove demoinabox demos
kubectl delete -f ~/demo-in-a-box*/hack/yaml/demoinabox-frontend.yaml
kubectl delete -f ~/demo-in-a-box*/hack/yaml/redis.yaml
kubectl delete -f ~/demo-in-a-box*/hack/yaml/mysql.yaml
kubectl delete -f ~/demo-in-a-box*/hack/yaml/demoinabox-backend.yaml

# (2) Stop the demoinabox frontend
sudo systemctl stop demoinabox.service

echo ""
echo ""
echo ""
echo DemoInABox has been removed.