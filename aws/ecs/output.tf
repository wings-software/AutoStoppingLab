output "name" {
  value = local.name
}

output "service" {
  value = "${aws_ecs_cluster.cluster.name}/${aws_ecs_service.sampleapp.name}"
}

output "rule" {
  value = "https://app.harness.io/ng/account/${data.harness_current_account.current.id}/ce/autostopping-rules/rule/${harness_autostopping_rule_ecs.rule.id}"
}

output "url" {
  value = harness_autostopping_rule_ecs.rule.custom_domains[0]
}