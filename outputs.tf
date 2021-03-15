output "consul_ingress_listener_rule_arn" {
  value       = aws_lb_listener_rule.consul_ingress.arn
  description = "AWS listener ARN for Consul ingress gateway"
}