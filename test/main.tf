locals {
  module_name = "terraform-aws-listener-rule"

  tags = {
    module  = local.module_name
    purpose = "test"
  }
  test_name = "${local.module_name}-module-test"
}

data "aws_vpc" "selected" {
  default = true
}

data "aws_subnet_ids" "selected" {
  vpc_id = data.aws_vpc.selected.id
}

resource "aws_lb" "module_test" {
  name               = local.module_name
  internal           = false
  load_balancer_type = "application"
  subnets            = data.aws_subnet_ids.selected.ids

  enable_deletion_protection = false

  tags = local.tags
}

resource "aws_lb_target_group" "module_test" {
  name        = local.module_name
  port        = 9090
  protocol    = "HTTP"
  vpc_id      = data.aws_vpc.selected.id
  target_type = "ip"

  health_check {
    enabled = true
  }
}

resource "aws_lb_listener" "module_test" {
  load_balancer_arn = aws_lb.module_test.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.module_test.arn
  }
}

module "listener_rule" {
  source                = "../"
  services              = var.services
  listener_arn          = aws_lb_listener.module_test.arn
  blue_target_group_arn = aws_lb_target_group.module_test.arn
  vpc_id                = data.aws_vpc.selected.id
  health_check_path     = "/health"
  service_kind          = "ingress-gateway"
}