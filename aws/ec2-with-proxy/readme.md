# ec2 with proxy

Create an EC2 autostopping rule using the proxy

**this requires an autostopping proxy, see the `proxy` example to provision one**

## Setup

1. Set all variables in `variable.tf` to values for your AWS and Harness account
2. [Configure AWS authentication](https://registry.terraform.io/providers/hashicorp/aws/latest/docs#authentication-and-configuration) for Terraform
3. [Configure Harness authentication](https://registry.terraform.io/providers/harness/harness/latest/docs) for Terraform

    a. `HARNESS_ACCOUNT_ID`: your Harness account id

    b. `HARNESS_PLATFORM_API_KEY`: an api key for your Harness account, with CCM admin permissions

## Provision

Run `terraform init` and `terraform apply` to:

1. Provision a security group to be used for the instance
2. Provision an ec2 as a web server
3. Create an autostopping rule for the web instance
