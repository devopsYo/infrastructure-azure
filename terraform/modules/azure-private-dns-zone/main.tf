resource "azurerm_private_dns_zone" "PrivateDnsZone" {
  name                = var.private_dns_zone_config.name
  resource_group_name = "${var.rg_config.prefix}-${var.rg_config.name}"
}


