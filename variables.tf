variable "services" {
  description = "Consul services monitored by Consul-Terraform-Sync"
  type = map(
    object({
      id        = string
      name      = string
      address   = string
      port      = number
      meta      = map(string)
      tags      = list(string)
      namespace = string
      status    = string

      node                  = string
      node_id               = string
      node_address          = string
      node_datacenter       = string
      node_tagged_addresses = map(string)
      node_meta             = map(string)
    })
  )
}

variable "listener_arn" {
  type        = string
  description = "ARN of listener to update"
}

variable "blue_target_group_arn" {
  type        = string
  description = "ARN of blue target group (existing target group with working application)"
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC for the target group"
}

variable "green_weight" {
  type        = number
  description = "Percentage of traffic to send to green deployment"
  default     = 0
}

variable "health_check_path" {
  type        = string
  description = "Path of health check for applications"
}

variable "listener_rule_priority" {
  type        = number
  default     = 1
  description = "Priority of listener rule between 1 to 50000"
  validation {
    condition     = var.listener_rule_priority > 0 && var.listener_rule_priority < 50000
    error_message = "The priority of listener rule must between 1 to 50000."
  }
}

locals {
  name = distinct([
    for service, service_data in var.services :
    service_data.name
  ])

  nodes = distinct([
    for service, service_data in var.services :
    service_data.node
  ])

  port = distinct([
    for service, service_data in var.services :
    service_data.port
  ])

  host = distinct([
    for service, service_data in var.services :
    service_data.meta.host
  ])

  weight = distinct([
    for service, service_data in var.services :
    lookup(service_data.meta, "weight", 0)
  ])

  datacenter = distinct([
    for service, service_data in var.services :
    service_data.node_datacenter
  ])
}