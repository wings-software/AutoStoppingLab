output "name" {
  value = local.name
}

output "ec2" {
  value = aws_instance.ec2.arn
}

output "rule" {
  value = "https://app.harness.io/ng/account/<harness account id>/ce/autostopping-rules/rule/${harness_autostopping_rule_vm.rule.id}"
}

output "url" {
  value = harness_autostopping_rule_vm.rule.custom_domains[0]
}