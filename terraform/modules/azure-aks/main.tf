resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.rg_config.prefix}-${var.aks_config.cluster_name}"
  location            = var.rg_config.location
  resource_group_name = "${var.rg_config.prefix}-${var.rg_config.name}"
  dns_prefix         = "${var.rg_config.prefix}-${var.aks_config.dns_prefix}"

  default_node_pool {
    name       = var.aks_config.node_name
    node_count = var.aks_config.node_count
    vm_size    = var.aks_config.node_vm_size
    vnet_subnet_id = var.aks_config_dependency.vnet_subnet_id
  }

  kubernetes_version = var.aks_config.kubernetes_version != null ? var.aks_config.kubernetes_version : null
  identity {
    type = var.aks_config.identity_type
  }
  network_profile {
    network_plugin     = var.aks_config.network_plugin
    load_balancer_sku  = var.aks_config.load_balancer_sku
    service_cidr       = var.aks_config.service_cidr
    dns_service_ip     = var.aks_config.dns_service_ip
  }
  tags = var.aks_config.tags
  
}