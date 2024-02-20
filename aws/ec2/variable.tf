variable "name" {
  type        = string
  description = "A unique key to use for all resource. If not set a random name is generated"
  default     = ""
}

variable "subnets" {
  type    = list(string)
  default = ["subnet-682a8223", "subnet-e357d99a", "subnet-bef497e4"]
}

variable "vpc" {
  type    = string
  default = "vpc-51edc228"
}

variable "region" {
  type    = string
  default = "us-west-2"
}

variable "ami" {
  type    = string
  default = "ami-0efcece6bed30fd98"
}

variable "hostedzone" {
  type    = string
  default = "Z2X614CI8JN37A"
}

variable "alb_arn" {
  type        = string
  description = "An existing ALB arn to use. If not set one will be created for you"
  default     = ""
}

variable "harness_cloud_connector_id" {
  type    = string
  default = "SE_AWS_CCM_Connector"
}
