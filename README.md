# qep Instructions

## Objective
This exercise will simulate:
* Instrumenting a new service within an existing application
* Viewing the overall application in Splunk Observability Cloud
* Adding manual instrumentation, including tags, to uncover issues with the application

## Pre-requisites
* You will start with an environment that already has:
  * Kubernetes (k3s)
  * The application, in the form of a deployment file
  * The source of the service you are introducing

## Initial Steps
To begin the exercise you will need to:
* Deploy the OTel Collector into Kubernetes
* Deploy the application
* Deploy your new service


