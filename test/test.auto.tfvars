region = "us-east-2"

services = {
  "my-application-895756f5f-dvdbk-my-application.ip-10-0-1-23.us-west-2.compute.internal.cloud" : {
    id      = "my-application-895756f5f-dvdbk-my-application"
    name    = "my-application"
    address = "10.0.1.30"
    port    = 9090
    meta = {
      host     = "my-application.my-company.net"
      pod-name = "my-application-895756f5f-dvdbk"
      weight   = 30
    }
    tags            = []
    namespace       = null
    status          = "passing"
    node            = "ip-10-0-1-23.us-west-2.compute.internal"
    node_id         = "0050311d-832b-b87b-6489-de1784ef07d5"
    node_address    = "10.0.1.29"
    node_datacenter = "cloud"
    node_tagged_addresses = {
      lan      = "10.0.1.29"
      lan_ipv4 = "10.0.1.29"
      wan      = "10.0.1.29"
      wan_ipv4 = "10.0.1.29"
    }
    node_meta = {
      consul-network-segment = ""
      pod-name               = "consul-consul-xlz6g"
    }
  },
  "my-application-895756f5f-c5hpp-my-application.ip-10-0-1-44.us-west-2.compute.internal.cloud" : {
    id      = "my-application-895756f5f-c5hpp-my-application"
    name    = "my-application"
    address = "10.0.1.45"
    port    = 9090
    meta = {
      host     = "my-application.my-company.net"
      pod-name = "my-application-895756f5f-c5hpp"
      weight   = 30
    }
    tags            = []
    namespace       = null
    status          = "passing"
    node            = "ip-10-0-1-44.us-west-2.compute.internal"
    node_id         = "15433dcf-8fd7-e3ff-a280-19a09fca84bf"
    node_address    = "10.0.1.46"
    node_datacenter = "cloud"
    node_tagged_addresses = {
      lan      = "10.0.1.46"
      lan_ipv4 = "10.0.1.46"
      wan      = "10.0.1.46"
      wan_ipv4 = "10.0.1.46"
    }
    node_meta = {
      consul-network-segment = ""
      pod-name               = "consul-consul-g46mj"
    }
  },
  "my-application-895756f5f-j2z46-my-application.ip-10-0-1-8.us-west-2.compute.internal.cloud" : {
    id      = "my-application-895756f5f-j2z46-my-application"
    name    = "my-application"
    address = "10.0.1.9"
    port    = 9090
    meta = {
      host     = "my-application.my-company.net"
      pod-name = "my-application-895756f5f-j2z46"
      weight   = 30
    }
    tags            = []
    namespace       = null
    status          = "passing"
    node            = "ip-10-0-1-8.us-west-2.compute.internal"
    node_id         = "50eec152-e970-79e8-1914-5f04c0ec792d"
    node_address    = "10.0.1.10"
    node_datacenter = "cloud"
    node_tagged_addresses = {
      lan      = "10.0.1.10"
      lan_ipv4 = "10.0.1.10"
      wan      = "10.0.1.10"
      wan_ipv4 = "10.0.1.10"
    }
    node_meta = {
      consul-network-segment = ""
      pod-name               = "consul-consul-78nsv"
    }
  }
}