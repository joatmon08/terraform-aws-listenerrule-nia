region = "us-east-2"

service_kind = "ingress-gateway"

services = {
  "consul-ingress-gateway-6fd76bdf66-p9qnt.ip-10-0-1-39.us-west-2.compute.internal.cloud" : {
    id              = "consul-ingress-gateway-6fd76bdf66-p9qnt"
    name            = "ingress-gateway"
    kind            = "ingress-gateway"
    address         = "10.0.1.39"
    port            = 30909
    meta            = {}
    tags            = []
    namespace       = null
    status          = "passing"
    node            = "ip-10-0-1-39.us-west-2.compute.internal"
    node_id         = "fd1def7c-d139-e1a9-4a96-822ddda3e80b"
    node_address    = "10.0.1.44"
    node_datacenter = "cloud"
    node_tagged_addresses = {
      lan      = "10.0.1.44"
      lan_ipv4 = "10.0.1.44"
      wan      = "10.0.1.44"
      wan_ipv4 = "10.0.1.44"
    }
    node_meta = {
      consul-network-segment = ""
      pod-name               = "consul-lcdsm"
    }
    cts_user_defined_meta = {}
  },
  "my-application-575957b495-24cw4-my-application.ip-10-0-1-12.us-west-2.compute.internal.cloud" : {
    id      = "my-application-575957b495-24cw4-my-application"
    name    = "my-application"
    kind    = ""
    address = "10.0.1.4"
    port    = 9090
    meta = {
      host     = "my-application.my-company.net"
      pod-name = "my-application-575957b495-24cw4"
      weight   = "0"
    }
    tags            = []
    namespace       = null
    status          = "passing"
    node            = "ip-10-0-1-12.us-west-2.compute.internal"
    node_id         = "58df9b87-bf3a-61b9-6e00-30e8f6ec9b23"
    node_address    = "10.0.1.9"
    node_datacenter = "cloud"
    node_tagged_addresses = {
      lan      = "10.0.1.9"
      lan_ipv4 = "10.0.1.9"
      wan      = "10.0.1.9"
      wan_ipv4 = "10.0.1.9"
    }
    node_meta = {
      consul-network-segment = ""
      pod-name               = "consul-2mpz6"
    }
    cts_user_defined_meta = {}
  },
  "my-application-575957b495-qxqhx-my-application.ip-10-0-1-30.us-west-2.compute.internal.cloud" : {
    id      = "my-application-575957b495-qxqhx-my-application"
    name    = "my-application"
    kind    = ""
    address = "10.0.1.20"
    port    = 9090
    meta = {
      host     = "my-application.my-company.net"
      pod-name = "my-application-575957b495-qxqhx"
      weight   = "0"
    }
    tags            = []
    namespace       = null
    status          = "passing"
    node            = "ip-10-0-1-30.us-west-2.compute.internal"
    node_id         = "3b545e12-1de4-49b8-8b06-80c7f06f9810"
    node_address    = "10.0.1.27"
    node_datacenter = "cloud"
    node_tagged_addresses = {
      lan      = "10.0.1.27"
      lan_ipv4 = "10.0.1.27"
      wan      = "10.0.1.27"
      wan_ipv4 = "10.0.1.27"
    }
    node_meta = {
      consul-network-segment = ""
      pod-name               = "consul-62srk"
    }
    cts_user_defined_meta = {}
  },
  "my-application-575957b495-cdvgw-my-application.ip-10-0-1-39.us-west-2.compute.internal.cloud" : {
    id      = "my-application-575957b495-cdvgw-my-application"
    name    = "my-application"
    kind    = ""
    address = "10.0.1.36"
    port    = 9090
    meta = {
      host     = "my-application.my-company.net"
      pod-name = "my-application-575957b495-cdvgw"
      weight   = "0"
    }
    tags            = []
    namespace       = null
    status          = "passing"
    node            = "ip-10-0-1-39.us-west-2.compute.internal"
    node_id         = "fd1def7c-d139-e1a9-4a96-822ddda3e80b"
    node_address    = "10.0.1.44"
    node_datacenter = "cloud"
    node_tagged_addresses = {
      lan      = "10.0.1.44"
      lan_ipv4 = "10.0.1.44"
      wan      = "10.0.1.44"
      wan_ipv4 = "10.0.1.44"
    }
    node_meta = {
      consul-network-segment = ""
      pod-name               = "consul-lcdsm"
    }
    cts_user_defined_meta = {}
  }
}