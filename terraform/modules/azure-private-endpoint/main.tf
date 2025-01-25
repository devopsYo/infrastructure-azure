resource "azurerm_private_endpoint" "PrivateEndpoint" {
  name                             = "${var.rg_config.prefix}-${var.private_endpoint_config.name}"
  resource_group_name              = "${var.rg_config.prefix}-${var.rg_config.name}"
  location                         = var.rg_config.location
  subnet_id                        = var.private_endpoint_config_dependency.subnet_id

  private_service_connection {
    name                           = var.private_endpoint_config.private_service_connection_name
    private_connection_resource_id = var.private_endpoint_config_dependency.private_connection_resource_id
    subresource_names              = var.private_endpoint_config.private_service_connection_subresource_names
    is_manual_connection           = var.private_endpoint_config.private_service_connection_is_manual_connection
  }

  dynamic "private_dns_zone_group" {
    for_each = var.private_endpoint_config.private_service_connection_is_manual_connection ? [] : [1]
    content {
      name                 = "${var.rg_config.prefix}-${var.private_endpoint_config.private_dns_zone_group_name}"
      private_dns_zone_ids = [var.private_endpoint_config_dependency.private_dns_zone_id]
    }
  }

}


