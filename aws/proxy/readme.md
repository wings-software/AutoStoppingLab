# Proxy

Create an EC2 auto stopping proxy

![image](https://github.com/wings-software/AutoStoppingLab/assets/7338312/48f4345e-cd50-42bf-a1f7-3be772b9180c)

## Resources

`aws_security_group.sgforproxy` a security group to allow access

`harness_autostopping_aws_proxy.rdsconnectproxy` a harness proxy resource, creates an ec2 in your account

## Setup

1. Set all variables in `variable.tf` to values for your AWS and Harness account
2. [Configure AWS authentication](https://registry.terraform.io/providers/hashicorp/aws/latest/docs#authentication-and-configuration) for Terraform
3. [Configure Harness authentication](https://registry.terraform.io/providers/harness/harness/latest/docs) for Terraform

    a. `HARNESS_ACCOUNT_ID`: your Harness account id

    b. `HARNESS_PLATFORM_API_KEY`: an api key for your Harness account, with CCM admin permissions

## Provision

Run `terraform init` and `terraform apply` to:

1. Provision a security group to be used for the proxy
2. Provision an autostopping proxy in the target account

## DNS

If you do not have a route53 hosted zone, then the proxy will be provisioned with a domain of `192.168.0.1.nip.io` which will resolve to `192.168.0.1`, once the proxy has been provisioned, locate the public IP of the proxy (or internal IP) and replace `192.168.0.1` in the terraform to that IP and re-apply the terraform.

## Destroy

If you run a `terraform destroy` you will still need to manually delete the proxy VM from AWS before the security group can be deleted via terraform.
