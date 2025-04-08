resource "harness_autostopping_aws_alb" "harness_alb" {
  name               = "${local.name}-lb"
  cloud_connector_id = var.harness_cloud_connector_id
  host_name          = local.lb_hostname
  alb_arn            = var.alb_arn == "" ? aws_lb.alb[0].arn : var.alb_arn
  region             = var.region
  vpc                = var.vpc
  security_groups    = [aws_security_group.http.id]
  # setting hosted zone is not needed when route53 is already set up externally
  # route53_hosted_zone_id            = "/hostedzone/${var.hostedzone}"
  delete_cloud_resources_on_destroy = false
}

resource "harness_autostopping_rule_vm" "rule" {
  name               = "${local.name}-ec2-rule"
  cloud_connector_id = var.harness_cloud_connector_id
  idle_time_mins     = 5
  filter {
    vm_ids  = [aws_instance.ec2.id]
    regions = [var.region]
  }
  http {
    proxy_id = harness_autostopping_aws_alb.harness_alb.identifier
    routing {
      source_protocol = "http"
      target_protocol = "http"
      source_port     = 80
      target_port     = 80
      action          = "forward"
    }
    health {
      protocol         = "http"
      port             = 80
      path             = "/"
      timeout          = 30
      status_code_from = 200
      status_code_to   = 299
    }
  }
  custom_domains = [local.lb_hostname]
}