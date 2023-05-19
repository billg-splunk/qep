#!/bin/bash

# This setup script will:
# (1) Build the credit-check-service app
# (2) Import it into k3s
#     (This step is so we don't need to use a public registry)
# (3) Deploy the service in kubernetes

# (1) Build the credit-check-service app
docker build -t credit-check-service:latest credicheckservice/.

# (2) Import it into k3s
sudo k3s ctr images import credit-check-service.tar

# Deploy the service in kubernetes
kubectl apply -f creditcheckservice/creditcheckservice.yaml