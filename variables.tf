variable "services" {
  description = "Consul services monitored by Consul-Terraform-Sync"
  type = map(
    object({
      id        = string
      name      = string
      kind      = string
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

      cts_user_defined_meta = map(string)
    })
  )
}

variable "listener_arn" {
  type        = string
  description = "ARN of listener to update"
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

variable "ingress_gateway_target_group_arn" {
  type        = string
  description = "Target Group ARN for Consul ingress gateway"
}

locals {
  name = distinct([
    for service, service_data in var.services :
    service_data.name if service_data.kind == "ingress-gateway"
  ])

  ip_addresses = toset([
    for service, service_data in var.services :
    replace(replace(split(".", service_data.node)[0], "ip-", ""), "-", ".") if service_data.kind == "ingress-gateway"
  ])

  port = distinct([
    for service, service_data in var.services :
    service_data.port if service_data.kind == "ingress-gateway"
  ])

  // Get a list of unique host headers defined by CTS services configuration
  host = coalescelist(distinct([
    for service, service_data in var.services :
    service_data.cts_user_defined_meta.host if service_data.kind != "ingress-gateway"
  ]))

  weight = distinct([
    for service, service_data in var.services :
    lookup(service_data.meta, "weight", 0) if service_data.kind != "ingress-gateway"
  ])

  datacenter = distinct([
    for service, service_data in var.services :
    service_data.node_datacenter if service_data.kind == "ingress-gateway"
  ])
}
