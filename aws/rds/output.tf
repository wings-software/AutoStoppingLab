output "name" {
  value = local.name
}

output "db" {
  value = var.rds_arn == "" ? aws_db_instance.rds[0].arn : var.rds_arn
}

output "rule" {
  value = "https://app.harness.io/ng/account/<harness account id>/ce/autostopping-rules/rule/${harness_autostopping_rule_rds.rule.id}"
}

output "connect" {
  value = "mysql --host=<proxy public ip>.nip.io --port=${random_integer.public_rds_port.result} --user=${var.dbuser} -p'${var.dbcred}'"
}
