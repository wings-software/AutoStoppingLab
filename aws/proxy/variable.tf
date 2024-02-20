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

variable "hostedzone" {
  type    = string
  default = "Z2X614CI8JN37A"
}

variable "harness_cloud_connector_id" {
  type    = string
  default = "SE_AWS_CCM_Connector"
}

variable "harness_proxy_api_key" {
  type        = string
  sensitive   = true
  description = "A Harness API key"
}
