variable "services" {
  description = "Consul services monitored by Consul-Terraform-Sync"
  type = map(
    object({
      id        = string
      name      = string
      address   = string
      port      = number
      kind      = string
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

variable "enable_health_check" {
  type        = bool
  description = "Enable health checking for target group"
  default     = true
}

variable "health_check_path" {
  type        = string
  description = "Path of health check for applications"
  default     = "/health"
}

variable "health_check_matcher" {
  type        = string
  description = "HTTP codes for health check"
  default     = "200"
}

variable "enable_stickiness" {
  type        = bool
  description = "Enable stickiness"
  default     = false
}

variable "stickiness_duration" {
  type        = number
  description = "Duration of stickness in seconds"
  default     = 600
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

variable "service_kind" {
  type        = string
  description = "Kind of Consul service. Can be ingress-gateway, terminating-gateway."
  default     = ""
}

locals {
  name = distinct([
    for service, service_data in var.services :
    service_data.name if service_data.kind == var.service_kind
  ])

  ip_addresses = toset([
    for service, service_data in var.services :
    replace(replace(split(".", service_data.node)[0], "ip-", ""), "-", ".") if service_data.kind == var.service_kind
  ])

  port = distinct([
    for service, service_data in var.services :
    service_data.port if service_data.kind == var.service_kind
  ])

  host = distinct([
    for service, service_data in var.services :
    service_data.meta.host if service_data.kind == ""
  ])

  weight = distinct([
    for service, service_data in var.services :
    lookup(service_data.meta, "weight", 0) if service_data.kind == ""
  ])

  datacenter = distinct([
    for service, service_data in var.services :
    service_data.node_datacenter if service_data.kind == var.service_kind
  ])
}
