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
    * You will need to make substitutions for {{variables}} using the setup.sh script
  * The source of the service you are introducing, creditcheckservice
  * The new service introduced for this exercise, creditprocessorservice

## Initial Steps
To begin the exercise you will need to:
* Deploy the OTel Collector into Kubernetes
  * You won't need profiling for this exercise
* Deploy the application
  * This will include:
    * The starting point of your service, creditcheckservice, uninstrumented
    * The new service introduced for the exercise, creditprocessorservice  

To do this:
* Deploy the otel collector, as you always would, using helm
* `cd` into the app directory, and run the `setup.sh` file and set the variables needed
* Then use `kubectl apply` to deploy the application
* Check that your application is running
* Check Splunk Observability to ensure you are getting results in the UI

## Your steps
You will now begin to implement what you need to for the proof of value, based on the customers evaluation. You will need to make changes to add auto-instrumentation and deploy it. And then you will need to edit the code to add more to the instrumentation (new timings, new tags, etc.)

## Useful commands

* Deploy a manifest:
```
kubectl apply -f <mainifest.yaml>
```


