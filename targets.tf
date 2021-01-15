data "aws_instances" "canary" {
  provider = aws.cloud
  filter {
    name   = "private-dns-name"
    values = local.nodes
  }
}

resource "aws_lb_target_group" "canary" {
  provider    = aws.datacenter
  name        = "${local.name.0}-${local.datacenter.0}"
  port        = local.port.0
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "instance"

  health_check {
    enabled = true
    path    = var.health_check_path
  }
}

resource "aws_lb_target_group_attachment" "app_canary" {
  provider          = aws.datacenter
  count             = length(data.aws_instances.canary.ids)
  target_group_arn  = aws_lb_target_group.canary.arn
  target_id         = data.aws_instances.canary.ids[count.index]
  port              = local.port.0
  availability_zone = "all"
}

resource "aws_lb_listener_rule" "app_canary" {
  provider     = aws.datacenter
  listener_arn = var.listener_arn
  priority     = var.listener_rule_priority

  action {
    type = "forward"
    forward {
      target_group {
        arn    = var.blue_target_group_arn
        weight = 100 - local.weight.0
      }

      target_group {
        arn    = aws_lb_target_group.canary.arn
        weight = local.weight.0
      }

      stickiness {
        enabled  = true
        duration = 600
      }
    }
  }

  condition {
    host_header {
      values = [local.host.0]
    }
  }
}