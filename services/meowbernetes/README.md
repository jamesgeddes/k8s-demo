# Meowbernetes

## Brief

Create a (cat themed) web application deployment in Kubernetes.

The application must be a single web service that, when deployed, is available on port 443 with SSL. The certificate
can be self-signed, however we would like to see cert-manager used and the cert to be provisioned (not hardcoded).
The application should show a picture and print “hello world”, the current time and the request headers in HTML on
the request path /hellocat. Function over form.

The application must consist of;

1. Its own namespace
1. A deployment for a Docker image containing your trivial “hello world” app.
1. A service (type=LoadBalancer). Assume some trivial load balancer to be present, i.e. MetalLB.
1. An ingress (Assume target cluster has ingress-nginx running).
1. A certificate (using cert-manager - should be installed by you).

Should;

- use GitOps
- have a clean setup
- work out of the box
- be possible to deploy this application into a locally running microk8s or minikube cluster.

## Flow

Here is the flow.

There are very few hard-coded values. Almost everything is derived from the Git repo, so you should be able to fork and
hit go.

### Infra

Terraform will;

- create a dockerhub repo
- create an eks cluster
- install argoCD into the cluster
- configure argoCD to pull services from the services directory
- create hashicorp vault secrets apps for each environment
- create github environments
- generate a random password per environment for the argoCD admin password
- set the argoCD admin password per environment
- store the argoCD admin password in each environments vault

### App

- python service returns a random cat
- dockerfile to build the service into a container
- github action to build the container and publish it to dockerhub
