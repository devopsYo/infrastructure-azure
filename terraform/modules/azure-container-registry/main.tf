data "azurerm_subscription" "current" {
}

resource "azurerm_user_assigned_identity" "UserManagedIdentity" {
  name                = "${var.container_registry_config.project_name}-pull-umi"
  location            = var.container_registry_config.location 
  resource_group_name = var.container_registry_config.resource_group_name
}


resource "azurerm_container_registry" "ContainerRegistry" {
  name                = "${var.container_registry_config.project_name}CR"
  resource_group_name = var.container_registry_config.resource_group_name
  location            = var.container_registry_config.location
  sku                 = var.container_registry_config.sku
  admin_enabled       = var.container_registry_config.admin_enabled
}

/*
module "ACRPrivateEndpoint" {
  source                             = "./modules/azure_private_endpoint"
  count                              = var.storage_account_config.public_network_access_enabled
  private_endpoint_config            = var.private_endpoint_config
  private_endpoint_config_dependency = {
    private_connection_resource_id       = azurerm_container_registry.ContainerRegistry.id
    subnet_id                            = private_endpoint_config_dependency.subnet_id
  }
  rg_config                                  = var.infra_config.plaque_list[count.index].rg_config
}
*/
/*
resource "azurerm_role_assignment" "AcrPull" {
  scope                = azurerm_container_registry.ContainerRegistry.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_user_assigned_identity.UserManagedIdentity.principal_id
}


resource "azurerm_role_assignment" "AcrPush" {
  scope                = azurerm_container_registry.ContainerRegistry.id
  role_definition_name = "AcrPush"
  principal_id         = data.azuread_service_principal.ServicePrincipalACR.object_id
}
/*