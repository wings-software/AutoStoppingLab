# ECS

Provision an ECS cluster, service, alb, and create an autostopping rule for the service.

![image](https://github.com/wings-software/AutoStoppingLab/assets/7338312/4b3e7ca2-383e-40fc-9fc0-53aeb9c5970e)

## Resources

`aws_ecs_cluster.cluster` a fargate ecs cluster

`aws_ecs_task_definition.service` a sample web application for ecs

`aws_ecs_service.sampleapp` the ecs service to run our example app

`aws_security_group.http` a security group for our web app


`aws_lb.alb` a load balancer for our application

`aws_lb_target_group.http` a target group to send traffic to our app

`aws_lb_listener.ecs` a listener for traffic on our alb


`harness_autostopping_aws_alb.harness_alb` a harness lb resource to import the alb created above

`harness_autostopping_rule_ecs.rule` an auto stop rule pointing at the alb/cluster/service created above

## How to use this terraform playbook?
Replace the variables in `variable.tf` file and then run the terraform commands listed above. This will:
1. Provision an ecs cluster
2. Deploy a sample service to the cluster
3. Create an ALB and loadbalance to the service
4. Create a Harness LB by importing the load balancer
5. Create an AutoStopping Rule for the ECS Service

### I already have an ECS cluster
1. Comment out `ecs.tf` file and replace the `aws_ecs_cluster.foo.id` with your ecs arn in `sample.tf`

### I already have an ALB
1. Comment out the section for alb in `alb.tf` (starting with`resource "aws_lb" "alb"`)
2. Replace `aws_lb.alb.arn` with your ALBs ARN
