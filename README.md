# qep Instructions

## Objective
This exercise will simulate:
* Instrumenting a new service within an existing application
* Viewing the overall application in Splunk Observability Cloud
* Adding manual instrumentation, including tags, to uncover issues with the application

> :warning: **Important Note**: Read all of these instructions here. There are some important details here, and if you gloss over them you may struggle to get your application instrumented and working.

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

You will need to add auto-instrumentation to your service and redeploy it. Once you've made any changes to the code or configuration we've provided a script for you to use for that process:
```
./9-redeploy.sh
```

Once you have done that you will iterate making changes to configuration, code, etc. to be able to demonstrate your requirements.

There are more than one way to do this exercise. If you can think of multiple ways to achieve something, try to pick the simplest one, but be aware of the options. And note down any decisions you made.

When you wrap up you will record:
* A 15 minute demo (tell-show-tell)
* A 5 minute explanation of the environment changes you made to make this demo happen

## Tips (some very important to know)

### Exercise Tips
  * To kick things off there's an immediate problem in code for **creditcheckservice** you will need to fix. This should get you comfortable making changes and redeploying.
    * You can either find and fix this problem before or after instrumentation.
    * If you do it after you can find it using Splunk Observability Cloud.
  * The **paymentservice** is using b3multi for context propagation
    * Which means you will need to configure **creditcheckservice** to use **b3multi** propagation as well.
    * While this isn't a common issue to run into, it does happen, and context propagation is a good topic to be aware of in general.
  * When your **creditcheckservice** is instrumented the logs will look something like the following:
  ```
  2023-05-30 14:08:11,566 INFO [waitress] [wasyncore.py:486] [trace_id=0 span_id=0 resource.service.name=creditcheckservice trace_sampled=False] - Serving on http://0.0.0.0:8888
  ```
  * Kubernetes commands shown below are good to know. Some of them have been incorporated in the convenience scripts.
    * For example `9-redeploy.sh` performs the following commands:
      * Builds the container image (`docker build`)
      * Exports the image from docker (`docker save`)
      * Imports it into k3s, so we don't need an image repository (`k3s ctr images import`)
        * This command is less common, but useful for testing quickly
      * Deploys the kubernetes manifest (`kubectl apply -f`), which will apply any changes
      * Deletes the pod, so it pulls down and starts the new one (`kubectl delete pod`)
    * Commands like `kubernetes logs` are useful but not provided in the convenience scripts.

### Kubernetes Tips
  * To see all of your pods:
  ```
  kubectl get pods
  ```
  * Some changes don't always force a restart of pods
  * To force a pod restarting (which will use the new container image):
  ```
  kubectl get pods
  # Copy Pod Name with <Control-Shift-c>
  kubectl delete pod <Control-Shift-v>
  ```
  * To see the logs for a pod:
  ```
  kubectl get pods
  # Copy Pod Name with <Control-Shift-c>
  kubectl logs <Control-Shift-v>
  ```
