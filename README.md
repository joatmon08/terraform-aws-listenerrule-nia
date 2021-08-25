# terraform-aws-listenerrule-nia

This module for Consul Terraform Sync creates a listener rule to be added to
an application load balancer. The listener rules offer a way to
change weights between blue and green instances of application.

The module register targets by IP address to account for multi-region
load balancing.

> Note: The module currently parses the DNS name of the node from Consul to
> register the primary IP address with the target group.
> This is because instances can have multiple IP addresses on different interfaces.
> Unless you bind Consul clients to the primary interface or the IP addresses
> on other interfaces are routable, you might have some connectivity issues.
> This is particularly the case with EKS.

## Prerequisites

- [Consul Terraform Sync](https://github.com/hashicorp/consul-terraform-sync) v0.1.0-beta

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >=3.55 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.55.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_lb_listener_rule.app_canary](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener_rule) | resource |
| [aws_lb_target_group.canary](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_lb_target_group_attachment.app_canary](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_blue_target_group_arn"></a> [blue\_target\_group\_arn](#input\_blue\_target\_group\_arn) | ARN of blue target group (existing target group with working application) | `string` | n/a | yes |
| <a name="input_enable_health_check"></a> [enable\_health\_check](#input\_enable\_health\_check) | Enable health checking for target group | `bool` | `true` | no |
| <a name="input_enable_stickiness"></a> [enable\_stickiness](#input\_enable\_stickiness) | Enable stickiness | `bool` | `false` | no |
| <a name="input_green_weight"></a> [green\_weight](#input\_green\_weight) | Percentage of traffic to send to green deployment | `number` | `0` | no |
| <a name="input_health_check_matcher"></a> [health\_check\_matcher](#input\_health\_check\_matcher) | HTTP codes for health check | `string` | `"200"` | no |
| <a name="input_health_check_path"></a> [health\_check\_path](#input\_health\_check\_path) | Path of health check for applications | `string` | `"/health"` | no |
| <a name="input_listener_arn"></a> [listener\_arn](#input\_listener\_arn) | ARN of listener to update | `string` | n/a | yes |
| <a name="input_listener_rule_priority"></a> [listener\_rule\_priority](#input\_listener\_rule\_priority) | Priority of listener rule between 1 to 50000 | `number` | `1` | no |
| <a name="input_service_kind"></a> [service\_kind](#input\_service\_kind) | Kind of Consul service. Can be ingress-gateway, terminating-gateway. | `string` | `""` | no |
| <a name="input_services"></a> [services](#input\_services) | Consul services monitored by Consul-Terraform-Sync | <pre>map(<br>    object({<br>      id        = string<br>      name      = string<br>      kind      = string<br>      address   = string<br>      port      = number<br>      meta      = map(string)<br>      tags      = list(string)<br>      namespace = string<br>      status    = string<br><br>      node                  = string<br>      node_id               = string<br>      node_address          = string<br>      node_datacenter       = string<br>      node_tagged_addresses = map(string)<br>      node_meta             = map(string)<br><br>      cts_user_defined_meta = map(string)<br>    })<br>  )</pre> | n/a | yes |
| <a name="input_stickiness_duration"></a> [stickiness\_duration](#input\_stickiness\_duration) | Duration of stickness in seconds | `number` | `600` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | ID of the VPC for the target group | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_listener_rule_arn"></a> [listener\_rule\_arn](#output\_listener\_rule\_arn) | n/a |
| <a name="output_target_group_arn"></a> [target\_group\_arn](#output\_target\_group\_arn) | n/a |
