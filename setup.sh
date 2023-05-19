#!/bin/bash

# This setup script will:
# (1) Remove demoinabox demos
# (2) Stop the demoinabox frontend
# (3) Upgrade the otel collector (for your org)
# (4) Redeploy the hipster shop app with 2 new services

# General variables
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

# Prompts
echo Enter environment:
read ENVIRONMENT
echo Enter realm:
read REALM
echo Enter ingest token:
read INGEST_TOKEN
echo Enter rum token:
read RUM_TOKEN

# (1) Remove demoinabox demos
sudo kubectl delete -f ~/demo-in-a-box*/hack/yaml/demoinabox-frontend.yaml
sudo kubectl delete -f ~/demo-in-a-box*/hack/yaml/redis.yaml
sudo kubectl delete -f ~/demo-in-a-box*/hack/yaml/mysql.yaml
sudo kubectl delete -f ~/demo-in-a-box*/hack/yaml/demoinabox-backend.yaml

# (2) Stop the demoinabox frontend
sudo systemctl stop demoinabox.service

# (3) Upgrade the otel collector (for your org)
OTEL_VALUES_PATH="$SCRIPTPATH/otel/values.yaml"
MY_OTEL_VALUES_PATH="$SCRIPTPATH/otel/values-mine.yaml"
# Remove if previous exists
if [[ -e $MY_OTEL_VALUES_PATH ]]; then
  rm "$MY_OTEL_VALUES_PATH"
  echo "Removed previous $MY_OTEL_VALUES_PATH"
fi
cp $OTEL_VALUES_PATH $MY_OTEL_VALUES_PATH
# Update environment
sed -i "s/{{environment}}/$ENVIRONMENT/" $MY_OTEL_VALUES_PATH

# Get the helm release
helmlist=$(helm list)
re=".*(splunk-otel-collector-[0-9]{3,}).*"
if [[ $helmlist =~ $re ]]; then
  HELMRELEASE=${BASH_REMATCH[1]};
  # Upgrade otel collector
  helm upgrade --set cloudProvider=" " --set distribution=" " \
  --set splunkObservability.accessToken="$INGEST_TOKEN" \
  --set clusterName="$ENVIRONMENT" --set splunkObservability.realm="$REALM" \
  --set gateway.enabled="false" \
  -f $MY_OTEL_VALUES_PATH
  splunk-otel-collector-1684502027 splunk-otel-collector-chart/splunk-otel-collector
else
  echo "ERROR: Cannot find helm release to upgrade the otel collector.";
fi

# (4) Redeploy the hipster shop app with 2 new services

# Delete the hipster-shop-mine.yaml
HIPSTERSHOP_PATH="$SCRIPTPATH/app/hipster-shop.yaml"
MY_HIPSTERSHOP_PATH="$SCRIPTPATH/app/hipster-shop-mine.yaml"
if [[ -e $MY_HIPSTERSHOP_PATH ]]; then
  rm "$MY_HIPSTERSHOP_PATHY_HI"
  echo "Removed previous $MY_HIPSTERSHOP_PATH"
fi
# Copy template
cp $HIPSTERSHOP_PATH $MY_HIPSTERSHOP_PATH
# Replace parameters
sed -i "s/{{environment}}/$ENVIRONMENT/" $MY_HIPSTERSHOP_PATH
sed -i "s/{{realm}}/$REALM/" $MY_HIPSTERSHOP_PATH
sed -i "s/{{rum_token}}/$RUM_TOKEN/" $MY_HIPSTERSHOP_PATH
sed -i "s/{{rum_app_name}}/$ENVIRONMENT-app/" $MY_HIPSTERSHOP_PATH
# Re-deploy app
kubectl apply -f $MY_HIPSTERSHOP_PATH