# Kubernetes Tips

This is split into a few tips: k3s-specific tips and other kubernetes tips.

## k3s Tips

**k3s** isn't something you need to think about much in production or with customers, but it is a useful tool to use in development and when you are working on samples in your own environment.

In this exercise we've setup the following:
* `paymentservice` and `creditprocessorservice`, like most of the other services, are pulling down from container registries.
* `creditcheckservice`, the one you are working on, is being built locally and added directly into your **k3s** system. That means we don't need to setup build pipelines and pulling down from a registy because we are doing everything with that locally.

You can look at the [script here](../9-redeploy.sh) to see how we are automating that process for your `creditcheckservice`:
* Code changes
  * `docker build`: Builds the container image
  * `docker save`: Exports the image from docker
  * `k3s ctr images import`: Imports that image file into k3s
    * That means we don't need an image repository to pull from
    * This command is k3s-specific, but useful for testing quickly
* Configuration changes
  * `kubectl apply -f <file>`: Deploys the kubernetes manifest
* Restart the service
  * `kubectl delete pod`: Deletes the pod, so it starts up again using the new configuration and code

:warning: **Important Note**: Are you getting a k3s permission error? If so [read this](#k3s-permissions-error).

## Other Kubernetes Tips

To get your application instrumented you are going to need to setup some environment variables.

You can look at some examples in the manifests but be careful of drawing too many conclusions because some services may have been implemented differently. There's a few ways that a service can be configured.

Make sure you look in [instrumentation](instrumentation.md), because there is a critical tip in there that needs to be configured for your map to show correctly before starting the exercise.

Some useful Kubernetes commands:

* To see all of your pods:
```
kubectl get pods
```
* Some changes don't always force a restart of pods. To force a pod restarting (which will use the new container image):
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

## k3s Permissions Error

* If you ever come back to the environment and get an error like:
```
WARN[0000]: Unable to read /etc/rancher/k3s/k3s.yaml, please start server with --write-kubeconfig-mode to modify kube config permissions
```
you can run the following command:
```
# NOTE: Not recommended for production
sudo chmod +r /etc/rancher/k3s/k3s.yaml
```
