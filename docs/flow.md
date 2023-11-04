Here is the flow.

There are almost no hard-coded values. Everything is derived from the Git repo.

## Infra

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

## App

- python service returns a random cat
- dockerfile to build the service into a container
- github action to build the container and publish it to dockerhub

## ArgoCD

ArgoCD then pulls the container into the Kubernetes cluster and starts it. Huzzah.