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
* Run `app/setup.sh` and enter the items requested
  * Environment (i.e. `qep`)
  * Realm (i.e. `us1`)
  * rum token (get from your Splunk Observability Cloud org)
* Then run `kubectl apply -f app/hipster-shop-mine.yaml` to deploy the application
* Check that your application is running with `kubectl get po`
* Check Splunk Observability Cloud to ensure you are getting results in the UI

## Your steps
You will now begin to implement what you need to for the proof of value, based on the customers evaluation. You will need to make changes to add auto-instrumentation and deploy it. And then you will need to edit the code to add more to the instrumentation (new timings, new tags, etc.)

## Useful commands

* Docker: Build the app to an image (from the app source directory)
```
docker build -t credit-check-service:latest .
```
* Docker: Run the app
```
docker run -p 8888:8888 credit-check-service:latest
# Test it
curl http://localhost:8888/test
```
* Kubernetes/k3s: Save an image, and import into k3s
```
docker save --output credit-check-service.tar credit-check-service:latest
sudo k3s ctr images import credit-check-service.tar
```
* Kubernetes: Deploy a manifest:
```
kubectl apply -f <mainifest.yaml>
```
