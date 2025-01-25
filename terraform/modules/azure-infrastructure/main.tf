module "ResourceGroup" {
  source                                      = "../../modules/azure-resource-group"
  count                                       = length(var.infra_config.plaque_list)
  rg_config                                   = var.infra_config.plaque_list[count.index].rg_config
}   


module "Vnet" {
  source                                      = "../../modules/azure-vnet"
  count                                       = length(var.infra_config.plaque_list)
  vnet_config                                 = var.infra_config.plaque_list[count.index].vnet_config
  rg_config                                   = var.infra_config.plaque_list[count.index].rg_config
  depends_on                                  = [
    module.ResourceGroup.Current
  ]
}



module "SubnetHub" {
  source                                     = "../../modules/azure-subnet"
  count                                      = length(var.infra_config.plaque_list)
  subnet_config                              = var.infra_config.plaque_list[count.index].subnet_hub_config
  subnet_config_dependency                   = {
    virtual_network_name                           = module.Vnet[count.index].Current.name
  }
  rg_config                                  = var.infra_config.plaque_list[count.index].rg_config
  depends_on                                 = [
    module.ResourceGroup.Current,
  ]
}


module "SubnetBastion" {
  source                                     = "../../modules/azure-subnet"
  count                                      = length(var.infra_config.plaque_list)
  subnet_config                              = var.infra_config.plaque_list[count.index].subnet_bastion_config
  subnet_config_dependency                   = {
    virtual_network_name                           = module.Vnet[count.index].Current.name
  }
  rg_config                                  = var.infra_config.plaque_list[count.index].rg_config
  depends_on                                 = [
    module.ResourceGroup.Current,
  ]
}

module "AKS" {
  source                                     = "../../modules/azure-aks"
  count                                      = length(var.infra_config.plaque_list)
  aks_config                              = var.infra_config.plaque_list[count.index].aks_config
  aks_config_dependency                   = {
    vnet_subnet_id                           = module.SubnetHub[count.index].Current.id
  }
  rg_config                                  = var.infra_config.plaque_list[count.index].rg_config
  depends_on                                 = [
    module.ResourceGroup.Current
  ]
}

module "ACR" {
  source       = "../../modules/azure-container-registry"
  count        = length(var.infra_config.plaque_list)
  acr_config   = var.infra_config.plaque_list[count.index].acr_config
  rg_config    = var.infra_config.plaque_list[count.index].rg_config
  depends_on   = [
    module.ResourceGroup.Current
  ]
}






