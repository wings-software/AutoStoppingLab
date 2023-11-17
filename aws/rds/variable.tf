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

variable "rds_arn" {
  type        = string
  description = "If you have an existing RDS to use set the arn here. Otherwise one will be created for you"
  default     = ""
}

variable "rds_port" {
  type    = number
  default = 3306
}

variable "proxy_id" {
  type = string
}

variable "dbuser" {
  type    = string
  default = "harness"
}

variable "dbcred" {
  type    = string
  default = "H$rn3ssTerraformTest"
}

variable "harness_cloud_connector_id" {
  type    = string
  default = "SE_AWS_CCM_Connector"
}
