#!/bin/bash

# This setup script will:
# (1) Build the credit-check-service app
# (2) Export the image from docker
# (3) Import it into k3s
#     (Steps 2 and 3 are so we don't need to use a public registry)
# (4) Deploy the service in kubernetes
#
# We will use 9-redeploy.sh to update the app.
# It adds a step of manually finding and deleting the pod,
# because unless the kubernetes manifest is changed the pod
# won't redeploy with the new container image until it restarts.

# (1) Build the credit-check-service app
docker build -t credit-check-service:latest creditcheckservice

# (2) Export the image from docker
docker save --output credit-check-service.tar credit-check-service:latest

# (3) Import it into k3s
sudo k3s ctr images import credit-check-service.tar

# (4) Deploy the service in kubernetes
kubectl apply -f creditcheckservice/creditcheckservice.yaml