# EC2

Provision an EC2 instance, alb, and create an autostopping rule for the instance.

![image](https://github.com/wings-software/AutoStoppingLab/assets/7338312/7ede2ec4-45a3-43ff-95d6-60abbaaea64d)

## Resources

`aws_instance.ec2` an ec2 instance set up as a web server

`aws_security_group.allow_http` a security group for our web app


`aws_lb.alb` a load balancer for our application

`aws_lb_target_group.http` a target group to send traffic to our app

`aws_lb_target_group_attachment` set our ec2 instance as the target for our group

`aws_lb_listener.ec2` a listener for traffic on our alb

`aws_lb_listener_rule.static` listen for traffic for our hostname


`harness_autostopping_aws_alb.harness_alb` a harness lb resource to import the alb created above

`harness_autostopping_rule_vm.rule` an auto stop rule pointing at the alb/instance created above

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

Once the TF completes, you will need to modify the rule in the Harness UI to link your rule to the route53 record.

![image](https://github.com/wings-software/AutoStoppingLab/assets/7338312/ab1a3163-3657-4244-833b-7e8ccb4b176b)

