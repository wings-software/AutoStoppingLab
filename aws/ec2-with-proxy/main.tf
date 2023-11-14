locals {
  name = var.name == "" ? random_pet.name.id : var.name
}

data "harness_current_account" "current" {}

resource "random_pet" "name" {
  keepers = {
    vpc = var.vpc
  }
}