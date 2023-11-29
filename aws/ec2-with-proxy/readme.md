# EC2 With Proxy

Provision an EC2 instance and create an autostopping rule for the instance.

This requires you have an auto stopping proxy deployed. See the `proxy` folder for an example.

## Resources 

`aws_security_group.allow_http` security group to allow traffic

`aws_instance.ec2` instance set up as a web server

`harness_autostopping_rule_vm.rule` auto stop rule for web server

### How to use this terraform playbook?
Replace the variables in `variable.tf` file and then run the terraform commands listed above. This will:
1. Provision an ec2 machine with nginx insalled
2. Create an AutoStopping Rule for the VM and add it under the specified proxy
