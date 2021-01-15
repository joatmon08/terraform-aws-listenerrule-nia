# terraform-aws-listener-rule

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

- [Consul Terraform Sync](https://github.com/hashicorp/consul-terraform-sync)

## Requirements

| Name | Version |
|------|---------|
| terraform | >=0.14 |
| aws | >=3.23 |

## Providers

| Name | Version |
|------|---------|
| aws | >=3.23 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| blue\_target\_group\_arn | ARN of blue target group (existing target group with working application) | `string` | n/a | yes |
| green\_weight | Percentage of traffic to send to green deployment | `number` | `0` | no |
| health\_check\_path | Path of health check for applications | `string` | n/a | yes |
| listener\_arn | ARN of listener to update | `string` | n/a | yes |
| listener\_rule\_priority | Priority of listener rule between 1 to 50000 | `number` | `1` | no |
| services | Consul services monitored by Consul-Terraform-Sync | <pre>map(<br>    object({<br>      id        = string<br>      name      = string<br>      address   = string<br>      port      = number<br>      meta      = map(string)<br>      tags      = list(string)<br>      namespace = string<br>      status    = string<br><br>      node                  = string<br>      node_id               = string<br>      node_address          = string<br>      node_datacenter       = string<br>      node_tagged_addresses = map(string)<br>      node_meta             = map(string)<br>    })<br>  )</pre> | n/a | yes |
| vpc\_id | ID of the VPC for the target group | `string` | n/a | yes |

## Outputs

No output.

