#!/bin/bash

# This setup script will:
# (1) Deploy the updated paymentservice service
#
# The paymentservice was deployed with the hipster shop,
# but this will deploy a new version which will be calling
# your creditcheckservice. You also don't have the updated code
# for this service, but you can see which APIs that it could
# possibly be calling, and you can look at the traces in
# Splunk Observability Cloud.

kubectl apply -f paymentservice/paymentservice.yaml

echo ""
echo ""
echo ""
echo Deployed the updated paymentservice.
echo ""
echo This service will now use your new creditcheckservice.
echo ""
echo Read the guides carefully.
echo It's now time to instrument the creditcheckservice.