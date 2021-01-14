region = "us-east-2"

services = {
  "api.worker-01.dc1" : {
    id      = "api"
    name    = "api"
    address = "10.1.0.2"
    port    = 9090
    meta = {
      host = "api.com"
    }
    namespace       = null
    status          = "passing"
    node            = "worker-01"
    node_id         = "9c893caa-0670-b5a5-431b-bd858b49ad4c"
    node_address    = "127.0.0.1"
    node_datacenter = "dc1"
    node_tagged_addresses = {
      lan      = "127.0.0.1"
      lan_ipv4 = "127.0.0.1"
      wan      = "127.0.0.1"
      wan_ipv4 = "127.0.0.1"
    }
    node_meta = {
      consul-network-segment = ""
    }
    tags = []
  },
  "api.worker-02.dc1" : {
    id      = "api-02"
    name    = "api"
    address = "10.1.0.3"
    port    = 9090
    meta = {
      host = "api.com"
    }
    namespace       = null
    status          = "passing"
    node            = "worker-02"
    node_id         = "9c893caa-0670-b5a5-431b-bd858b49ad4c"
    node_address    = "127.0.0.1"
    node_datacenter = "dc1"
    node_tagged_addresses = {
      lan      = "127.0.0.1"
      lan_ipv4 = "127.0.0.1"
      wan      = "127.0.0.1"
      wan_ipv4 = "127.0.0.1"
    }
    node_meta = {
      consul-network-segment = ""
    }
    tags = []
  }
}