locals {
  name        = var.name == "" ? random_pet.name.id : lower(var.name)
  lb_hostname = "${local.name}.${data.aws_route53_zone.zone.name}"
  tags = {
    lb_hostname = local.lb_hostname
  }
}

data "harness_platform_current_account" "current" {}

data "aws_route53_zone" "zone" {
  zone_id = var.hostedzone
}

resource "aws_route53_record" "alb" {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = local.lb_hostname
  type    = "CNAME"
  ttl     = "60"
  records = [aws_lb.alb[0].dns_name]
}

resource "random_pet" "name" {
  keepers = {
    ami = var.ami
  }
}