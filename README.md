# qep Instructions

## Objective
This exercise will simulate:
* Instrumenting a new service within an existing application
* Viewing the overall application in Splunk Observability Cloud
* Adding manual instrumentation, including tags, to uncover issues with the application

## Pre-requisites
* You will start with an environment that already has:
  * Kubernetes (k3s)
  * docker
  * Hipster Shop (the demo application)
  * Your service and code (creditcheckservice)
  * A new service your service relies on (creditprocessorservice)

## Initial Steps
To begin the exercise you will need to:
* Get an "Observability Portfolio Demo" environment
* Clone this repo
* Run the setup scripts in order
```
cd qep
./1-docker-setup.sh
# Exit and come back to this instance
./2-remove-diab.sh
./3-upgrade-otel-and-deploy-app.sh
# Set the values from your Splunk Observability Cloud org
./4-deploy-creditcheckservice.sh
./5-deploy-creditprocessorservice.sh
```

## Your steps
You will now begin to implement what you need to for the proof of value, based on the customer requirements you received.

The service that you are working on is **creditcheckservice**. It sits between the **paymentservice** and the **creditprocessorservice**.

You will need to add auto-instrumentation to your service and redeploy it. We've made a simple script for you to use for that process:
```
./9-redeploy.sh
```

Once you have done that you will iterate making changes to configuration, code, etc. to be able to demonstrate your requirements.

There are more than one way to do this exercise. If you can think of multiple ways to achieve something, try to pick the simplest one, but be aware of the options.

When you wrap up you will record:
* A 15 minute demo (tell-show-tell)
* A 5 minute explanation of the environment changes you made to make this demo happen