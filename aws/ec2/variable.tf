variable "name" {
  type        = string
  description = "A unique key to use for all resource. If not set a random name is generated"
  default     = ""
}

variable "alb_subnets" {
  type = list(string)
}

variable "ec2_subnet" {
  type = string
}

variable "vpc" {
  type = string
}

variable "region" {
  type    = string
  default = "us-west-2"
}

variable "ami" {
  type        = string
  default     = "ami-0efcece6bed30fd98"
  description = "ubuntu ami (default for us-west-2)"
}

variable "hostedzone" {
  type = string
}

variable "alb_arn" {
  type        = string
  description = "An existing ALB arn to use. If not set one will be created for you"
  default     = ""
}

variable "harness_cloud_connector_id" {
  type = string
}
