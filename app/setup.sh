#!/bin/bash

# Get paths
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

# Delete the hipster-shop-mine.yaml
MY_YAML="hipster-shop-mine.yaml"
MY_YAML_PATH="$SCRIPTPATH/$MY_YAML"
if [[ -e $MY_YAML_PATH ]] then
  rm "$SCRIPTPATH/$MY_YAML"
  echo "Removed previous $MY_YAML"
fi

# Get parameters
echo Enter environment:
read ENVIRONMENT
echo Enter realm:
read REALM
echo Enter rum token:
read RUM_TOKEN

# Create file
ORIGINAL_YAML="hipster-shop.yaml"
ORIGINAL_YAML_PATH="$SCRIPTPATH/$ORIGINAL_YAML"

cp $ORIGINAL_YAML_PATH $MY_YAML_PATH

sed -i "s/{{environment}}/$ENVIRONMENT/" $MY_YAML_PATH
sed -i "s/{{realm}}/$REALM/" $MY_YAML_PATH
sed -i "s/{{rum_token}}/$RUM_TOKEN/" $MY_YAML_PATH
sed -i "s/{{rum_app_name}}/$ENVIRONMENT-app/" $MY_YAML_PATH
