variable "aks_config" {
  description = "AKS Cluster configuration"
  type = object({
    cluster_name       = string
    dns_prefix         = string
    node_name          = string
    node_count         = number
    node_vm_size       = string
    kubernetes_version = string
    identity_type      = string
    network_plugin     = string
    load_balancer_sku  = string
    service_cidr       = string
    dns_service_ip     = string
    tags               = map(string)
  })
}

variable "aks_config_dependency" {
    type = object({
        vnet_subnet_id                     = string
    })
}

variable "rg_config" {
    type = object({
        name                            = string
        location                        = string
        prefix                          = string 
    })
}