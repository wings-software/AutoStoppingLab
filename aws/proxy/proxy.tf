# Create a proxy vm with a public IP
resource "harness_autostopping_aws_proxy" "rdsconnectproxy" {
  name                   = substr("${local.name}-proxy", 0, 20)
  cloud_connector_id     = var.harness_cloud_connector_id
  host_name              = var.hostedzone == "" ? "192.168.0.1.nip.op" : "${local.name}.${data.aws_route53_zone.zone[0].name}"
  region                 = var.region
  vpc                    = var.vpc
  security_groups        = [aws_security_group.sgforproxy.id]
  route53_hosted_zone_id = var.hostedzone == "" ? null : "/hostedzone/${var.hostedzone}"
  machine_type           = "t3.micro"
  api_key                = var.harness_proxy_api_key
  allocate_static_ip     = false
}
