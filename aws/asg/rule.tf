resource "harness_autostopping_aws_alb" "harness_alb" {
  name                   = "${local.name}-lb"
  cloud_connector_id     = var.harness_cloud_connector_id
  host_name              = local.tags.lb_hostname
  alb_arn                = var.alb_arn == "" ? aws_lb.alb[0].arn : var.alb_arn
  region                 = var.region
  vpc                    = var.vpc
  security_groups        = [aws_security_group.http.id]
  route53_hosted_zone_id = "/hostedzone/${var.hostedzone}"
}

# rule not supported in TF yet