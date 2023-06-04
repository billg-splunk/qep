# qep Instructions

## Objective
This exercise will simulate:
* Instrumenting a new service within an existing application
* Viewing the overall application in Splunk Observability Cloud
* Adding manual instrumentation, including tags, to uncover issues with the application

> :warning: **Important Note**: Read all of these instructions here. There are some important details here, and if you gloss over them you may struggle to get your application instrumented and working.

## Pre-requisites
You will start with an EC2 environment that already has some useful components, but we will perform some [initial steps](#initial-steps) in order to get to the following state:
  * Kubernetes (k3s)
  * Hipster Shop (the demo application)
  * `paymentservice`: Updated service, instrumented
  * `creditcheckservice`: Your service and code, uninstrumented
  * `creditprocessorservice`: A new service your service relies on, instrumented

## Initial Steps
To begin the exercise you will need to:
* Get an "Observability Portfolio Demo" environment
* Clone this repo
* Run the setup scripts in order
```
cd qep
./1-docker-setup.sh
# Exit and ssh back to this instance
./2-remove-diab.sh
./3-upgrade-otel-and-deploy-app.sh
# Set the values from your Splunk Observability Cloud org
./4-deploy-creditcheckservice.sh
./5-deploy-creditprocessorservice.sh
./6-deploy-updated-paymentservice.sh
```

## Your steps
You will now begin to implement what you need to for the proof of value, based on the customer requirements you received.

The service that you are working on is **creditcheckservice**. It sits between the **paymentservice** and the **creditprocessorservice**.

You will need to add auto-instrumentation to your service and redeploy it. Once you've made any changes to the code or configuration we've provided a script for you to use for that process:
```
./9-redeploy.sh
```

Once you have done that you will iterate making changes to configuration, code, etc. to be able to demonstrate your requirements.

There are more than one way to do this exercise. If you can think of multiple ways to achieve something, try to pick the simplest one, but be aware of the options. And note down any decisions you made.

When you wrap up you will record a max-20 minute demo/review:
* A 15 minute demo (tell-show-tell)
* A 5 minute explanation of some of the environment changes you made to make this demo happen
  * This doesn't need to cover everything; just cover a few things that you thought were interesting in the configuration process, or any interesting decisions you made.

## Tips (some very important to know)

* [Python](docs/python.md)
* [Instrumentation](docs/instrumentation.md)
* [Docker](docs/docker.md)
* [Kubernetes](docs/kubernetes.md)