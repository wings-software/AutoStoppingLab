locals {
  name = var.name == "" ? random_pet.name.id : var.name
}

data "aws_route53_zone" "zone" {
  zone_id = var.hostedzone
}

resource "random_pet" "name" {
  keepers = {
    vpc = var.vpc
  }
}