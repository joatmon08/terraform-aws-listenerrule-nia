output "target_group_arn" {
  value = aws_lb_target_group.canary.arn
}

output "listener_rule_arn" {
  value = aws_lb_listener_rule.app_canary.arn
}