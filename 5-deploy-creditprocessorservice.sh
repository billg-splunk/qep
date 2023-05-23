#!/bin/bash

# This setup script will:
# (1) Deploy the creditprocessorservice
#
# This is a new service for which you don't have the source
# code. But you can look in the source code for
# creditcheckservice to see what APIs it is using from it.

# (1) Deploy the creditprocessorservice

kubectl apply -f creditprocessorservice/creditprocessorservice.yaml
