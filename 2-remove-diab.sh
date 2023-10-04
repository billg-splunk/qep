#!/bin/bash

# This setup script will:
# (1) Remove demoinabox demos
# (2) Stop the demoinabox frontend
# (3) Remove the OTelCollector (or multiple, if found)

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

# (3) Remove any otel collectors
helmlist=$(helm list)
re="(splunk-otel-collector[^[:space:]]+)"
while [[ $helmlist =~ $re ]]; do
  HELMRELEASE=${BASH_REMATCH[1]};
  # Remove otel collector
  echo "INFO: Removed otel collector $HELMRELEASE"
  helm uninstall $HELMRELEASE
  helmlist=$(helm list)
done

echo ""
echo ""
echo ""
echo DemoInABox and the OTel Collector has been removed.
