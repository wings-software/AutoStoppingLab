locals {
  name = var.name == "" ? random_pet.name.id : var.name
  tags = {
    lb_hostname = "${local.name}.${data.aws_route53_zone.zone.name}"
  }
}

data "aws_route53_zone" "zone" {
  zone_id = var.hostedzone
}

resource "random_pet" "name" {
  keepers = {
    ami = var.ami
  }
}