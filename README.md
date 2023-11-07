# Getting started

Following are the requirements to get started

1. Terraform setup and ready to run
2. Harness Account ID
3. AutoStopping enabled cloud connector ID
4. Next gen API key (personal key/service token)

Each folder contains `variable.tf`. Modify the following variables accordingly:

```
variable "account_id" {
  type    = string
  default = "wOSgd9G8SuajZo1dISEF2g"
}
variable "cloud_connector_id" {
  type    = string
  default = "Lightwing_Non_Prod"
}
variable "api_key" {
  type    = string
  default = "Set the env variable TF_VAR_api_key"
}
```

# Creating AutoStopping proxy

This is required for any sample app installation which uses proxy.

```
cd aws/proxy
terraform init
terraform apply
```

# EC2 HTTP & SSH with proxy

```
cd aws/ec2-with-proxy
```

- Open the `variable.tf` file and change the following values
- `proxy_id`: Copy the proxy id from the [Load Balancers](https://app.harness.io/ng/account/wOSgd9G8SuajZo1dISEF2g/ce/access-points) page in Harness 
- `proxy_public_ip`: Copy the proxy public IP from AWS console. Search for proxy name in the AWS EC2 instance list and copy the public IP

```
cd aws/ec2-with-proxy
terraform init
terraform apply
```


# RDS Connect using proxy

```
cd aws/rdsconnect
terraform init
terraform plan
```

