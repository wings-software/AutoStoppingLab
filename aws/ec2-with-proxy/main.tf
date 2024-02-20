locals {
  name = var.name == "" ? random_pet.name.id : var.name
}

resource "random_pet" "name" {
  keepers = {
    vpc = var.vpc
  }
}