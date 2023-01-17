This demo has been designed with one Terraform workspace per development environment.
- test
- preprod
- prod

This is, clearly, an oversimplification of the
[Terraform Recommended Workflow](https://developer.hashicorp.com/terraform/cloud-docs/recommended-practices/part1)
but this is just a demo.

To apply the configuration using these workspaces,

1. Create the worksapces.

```bash
terraform workspace new test
terraform workspace new preprod
terraform workspace new prod
```

2. Switch to a workspace

```bash
terraform workspace select test
```

3. Apply the config, bringing in the environment variables

```bash
terraform apply -var-file $(terraform workspace show).tfvars
```

## Costs
Remember, EKS costs from $0.10 per hour or $73 per month, so `terraform destry` each 
environment when you are done. 

No, I will not pay your AWS bill.