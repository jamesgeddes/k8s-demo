# k8s-demo
A simple demonstration of the deployment of a Kubernetes cluster to AWS. 

## Brief
- In the cloud of your choice, create a kubernetes cluster with at least 1 controller and 2 
  worker nodes.
- Write a deployment to the above cluster using the tooling of your choice.
- Provide some basic documentation on how to reproduce the above steps

## Solution

This configuration creates an EKS cluster on AWS and deploys NGINX to it, all using Terraform. 
Documentation is available in [docs](docs).

## Foolish assumptions
This demo assumes that you know satisfactorily comfortable with,
- Terraform
- AWS
- Setting Terraform up for your AWS account
- Kubernetes

## Basic Use

1. Create a workspace `terraform workspace new test`
2. Apply the config `terraform apply -var-file $(terraform workspace show).tfvars`
3. Grab a [cuppa](https://youtu.be/UksDKoCqbd4)
4. Whabam! Stare at your AWS console in awe and wonder as a brand new EKS cluster magically 
   appears before your very eyes. Ooo. Aaaa.
5. Destroy the cluster before it empties your bank account. `terraform destroy`


## Details

Further detail can be found in the [docs](docs).

## License

All the goodness of GPLv3 is at your disposal. Crack on.