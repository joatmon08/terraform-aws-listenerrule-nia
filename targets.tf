resource "aws_lb_listener_rule" "consul_ingress" {
  listener_arn = var.listener_arn
  priority     = var.listener_rule_priority

  action {
    type             = "forward"
    target_group_arn = var.ingress_gateway_target_group_arn
  }

  condition {
    host_header {
      values = local.host
    }
  }
}