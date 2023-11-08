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


## Details

Further detail can be found in the [docs](docs).

## License

All the goodness of GPLv3 is at your disposal. Crack on.