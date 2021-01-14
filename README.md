# terraform-aws-listener-rule

This module creates listener rules to be added to
an application load balancer. The listener rules offer a way to
change weights between blue and green instances of application.

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

