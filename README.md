# k8s-demo
A simple demonstration of the deployment of a Kubernetes cluster to AWS. 

## Brief
- In the cloud of your choice, create a kubernetes cluster with at least 1 controller and 2 
  worker nodes.
- Write a deployment to the above cluster using the tooling of your choice.
- Provide some basic documentation on how to reproduce the above steps

## Solution

This configuration creates an EKS cluster on AWS and deploys ArgoCD to it, all using Terraform.
ArgoCD is then configured to deploy all the services in the services directory.
Documentation is available in [docs](docs).

## Foolish assumptions
This demo assumes that you know satisfactorily comfortable with,
- Terraform
- AWS
- Setting Terraform up for your AWS account
- Kubernetes

## Flow

Here is the flow.

There are very few hard-coded values. Almost everything is derived from the Git repo, so you should be able to fork and
hit go.

- terraform/vault
  - create hashicorp vault secrets app
  - create a random ArgoCD admin password
  - store the ArgoCD admin password in vault

- terraform/dockerhub
  - create a dockerhub repo

- terraform/iam
  - create iam rules
  - create iam policies

- terraform/networking
  - create a load balancer
  - set dns
  - set security groups
  - create a vpc

- terraform/k8s-cluster
  - create an eks cluster
  - install ArgoCD into the cluster via helm
  - set the ArgoCD admin password from vault

- for each service (`./services/*`)
  - scan the code
  - build the container
  - scan the container
  - publish container to dockerhub
- terraform/k8s-services
  - configure ArgoCD to pull services from manifests in `services/*/manifest.yaml`

- ArgoCD deploys containers specified in manifests
- python meowbernetes service returns a random cat when user visits k8s-demo.net/meobernetes

## Unusual additions

The use of the `ACTIVATED` var would probably not be seen in a production setting. This is in place so that the nightly
destroy job, which is in place as this is just a demo, does not run unnecessarily. In a production setting, one would
rarely want to run `terraform destory`.

## Details

Further detail can be found in the [docs](docs).

## License

All the goodness of GPLv3 is at your disposal. Crack on.