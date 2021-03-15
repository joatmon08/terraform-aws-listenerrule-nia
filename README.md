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
| terraform | >=0.14 |
| aws | >=3.32 |

## Providers

| Name | Version |
|------|---------|
| aws | >=3.32 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| blue\_target\_group\_arn | ARN of blue target group (existing target group with working application) | `string` | n/a | yes |
| enable\_health\_check | Enable health checking for target group | `bool` | `true` | no |
| enable\_stickiness | Enable stickiness | `bool` | `false` | no |
| green\_weight | Percentage of traffic to send to green deployment | `number` | `0` | no |
| health\_check\_matcher | (Required for HTTP/HTTPS/GRPC ALB) The response codes to use when checking for a healthy responses from a target. You can specify multiple values (for example, "200,202" for HTTP(s) or "0,12" for GRPC) or a range of values (for example, "200-299" or "0-99"). Applies to Application Load Balancers only (HTTP/HTTPS/GRPC), not Network Load Balancers (TCP). | `string` | `"200"` | no |
| health\_check\_path | Path of health check for applications | `string` | `"/health"` | no |
| listener\_arn | ARN of listener to update | `string` | n/a | yes |
| listener\_rule\_priority | Priority of listener rule between 1 to 50000 | `number` | `1` | no |
| service\_kind | Kind of Consul service. Can be ingress-gateway, terminating-gateway. | `string` | `""` | no |
| services | Consul services monitored by Consul-Terraform-Sync | <pre>map(<br>    object({<br>      id        = string<br>      name      = string<br>      kind      = string<br>      address   = string<br>      port      = number<br>      meta      = map(string)<br>      tags      = list(string)<br>      namespace = string<br>      status    = string<br><br>      node                  = string<br>      node_id               = string<br>      node_address          = string<br>      node_datacenter       = string<br>      node_tagged_addresses = map(string)<br>      node_meta             = map(string)<br><br>      cts_user_defined_meta = map(string)<br>    })<br>  )</pre> | n/a | yes |
| stickiness\_duration | Duration of stickiness in seconds | `number` | `600` | no |
| vpc\_id | ID of the VPC for the target group | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| listener\_rule\_arn | AWS listener arn ARN for canary |
| target\_group\_arn | AWS target group ARN for canary |

