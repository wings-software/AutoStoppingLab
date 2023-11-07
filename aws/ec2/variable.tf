variable "name" {
  type    = string
  default = "test-tf"
}

variable "subnets" {
  type    = list(string)
  default = ["subnet-e6e3c9ad", "subnet-bb7be890", "subnet-b96873e3"]
}

variable "vpc" {
  type    = string
  default = "vpc-c1e05fb9"
}
variable "region" {
  type    = string
  default = "us-west-2"
}
variable "hostedzone" {
  type    = string
  default = "/hostedzone/Z06070943NA512B2KHEHF"
}
# HARNESS Variables
variable "account_id" {
  type    = string
  default = "Lightwing_Non_Prod"
}
variable "cloud_connector_id" {
  type    = string
  default = "Lightwing_Non_Prod"
}
variable "api_key" {
  type    = string
  default = "Lightwing_Non_Prod"
}

locals {
  tags = {
    lb_hostname = "${var.name}.lightwingtest.com"
  }
}
