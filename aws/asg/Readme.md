# Example of Creating an AWS AutoScalingGroup
This example will create an AWS ALB, an ASG, install Nginx on the ASG instances and load balance the ASG under the created ALB

## files

### variables.tf
This file will contain all the variables required for the terraform template. Please make the necessary changes to the values according to your environment. The variables to change are:
* `name`: This string will be prepended to all the identifiers created as part of this template
* `vpc`: All the components will be created under this vpc
* `subnets`: These are the subnets used to provision the ALB
* `region`: The components will be provisioned on this AWS region
* `ami`: This image will be used to create the AWS AutoScaling Group
* `availability_zones`: These availability zones will be used to create the ASG
* `lb_hostname`: This will be used to create the header match on AWS ALB for the ASG

### security_group.tf
This file will create a security group with the name `${var.name}-asg-allow_http` with the following ports
* Inbound: Allow TCP traffic on port `80` from everywhere (`0.0.0.0/0`)
* Outbound: Everything

### asg.tf
This file will create an ASG with the name `${var.name}-asg` with specified `variables.tf` as config and userdata defined in `userdata.tpl`

### alb.tf
This file will create an AWS ALB named `${var.name}-lb` with the configs defined in `variables.tf` along with:
* target group named `${var.name}-asg-tg`
* security group named `"${var.name}-alb`
* ALB listener and rule attached to the ASG with host header `"ec2rule.${local.tags.lb_hostname}"`
