
# Create RDS AutoStopping rule
resource "harness_autostopping_rule_rds" "test" {
  name               = var.name
  cloud_connector_id = var.cloud_connector_id
  idle_time_mins     = 30
  database {
    id     = var.rds_arn
    region = var.region
  }

  tcp {
    proxy_id = var.proxy_id
    forward_rule {
      port = var.rds_port
    }
  }
}