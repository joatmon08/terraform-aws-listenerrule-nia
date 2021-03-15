output "target_group_arn" {
  value = aws_lb_target_group.canary.arn
  description = "AWS target group ARN for canary"
}

output "listener_rule_arn" {
  value = aws_lb_listener_rule.app_canary.arn
  description = "AWS listener arn ARN for canary"
}