variable "name" {
  type        = string
  description = "A unique key to use for all resource. If not set a random name is generated"
  default     = ""
}

variable "vpc" {
  type    = string
  default = "vpc-51edc228"
}

variable "region" {
  type    = string
  default = "us-west-2"
}

variable "proxy_id" {
  type = string
}

variable "proxy_public_ip" {
  type = string
}

variable "harness_cloud_connector_id" {
  type    = string
  default = "SE_AWS_CCM_Connector"
}
