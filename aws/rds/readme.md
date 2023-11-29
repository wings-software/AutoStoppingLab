# RDS

Create an RDS instance, and an auto stopping rule for it.

This requires you have an auto stopping proxy deployed. See the `proxy` folder for an example.

![image](https://github.com/wings-software/AutoStoppingLab/assets/7338312/b78a0587-b675-4f43-af7e-c3fee97241bc)

## Resources

`aws_security_group.allow_mysql` security group to allow sql access to db

`aws_db_instance.rds` rds instance

`harness_autostopping_rule_rds.rule` harness auto stop rule for the database

## Setup

1. Set all variables in `variable.tf` to values for your AWS and Harness account
2. [Configure AWS authentication](https://registry.terraform.io/providers/hashicorp/aws/latest/docs#authentication-and-configuration) for Terraform
3. [Configure Harness authentication](https://registry.terraform.io/providers/harness/harness/latest/docs) for Terraform

    a. `HARNESS_ACCOUNT_ID`: your Harness account id

    b. `HARNESS_PLATFORM_API_KEY`: an api key for your Harness account, with CCM admin permissions

## Provision

Run `terraform init` and `terraform apply` to:

1. Provision a security group to be used for the instance
2. Provision an rds instance
3. Create an autostopping rule for the rds instance
