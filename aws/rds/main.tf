locals {
  name = var.name == "" ? random_pet.name.id : var.name
}

data "harness_current_account" "current" {}

resource "random_pet" "name" {
  keepers = {
    vpc = var.vpc
  }
}

resource "random_integer" "public_rds_port" {
  min = 1024
  max = 65535
  keepers = {
    rds_port = var.rds_port
  }
}