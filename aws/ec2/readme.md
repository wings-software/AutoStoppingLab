# ec2

EC2 autostopping with ALB

## Setup

1. Set all variables in `variable.tf` to values for your AWS and Harness account
2. [Configure AWS authentication](https://registry.terraform.io/providers/hashicorp/aws/latest/docs#authentication-and-configuration) for Terraform
3. [Configure Harness authentication](https://registry.terraform.io/providers/harness/harness/latest/docs) for Terraform

    a. `HARNESS_ACCOUNT_ID`: your Harness account id

    b. `HARNESS_PLATFORM_API_KEY`: an api key for your Harness account, with CCM admin permissions

## Provision

Run `terraform init` and `terraform apply` to:

1. Provision an ec2 machine with nginx insalled
2. Provision an ALB and create a rule for routing to the VM
3. Create a Harness Lb with the ALB
4. Create an AutoStopping Rule for the VM
