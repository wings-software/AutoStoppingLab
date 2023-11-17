resource "harness_autostopping_rule_rds" "rule" {
  name               = "${local.name}-db"
  cloud_connector_id = var.harness_cloud_connector_id
  idle_time_mins     = 30

  database {
    id     = var.rds_arn == "" ? aws_db_instance.rds[0].arn : var.rds_arn
    region = var.region
  }

  tcp {
    proxy_id = var.proxy_id
    forward_rule {
      connect_on = random_integer.public_rds_port.result
      port       = var.rds_port
    }
  }
}