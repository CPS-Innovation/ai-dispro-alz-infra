data "azurerm_subnet" "psql_subnet" {
  name                 = "snet-psql-${var.environment}-01"
  virtual_network_name = "vnet-aid-${var.subscription}-01"
  resource_group_name  = "rg-aid-${var.subscription}-01"
}

data "azurerm_key_vault" "cmk_kv" {
  name                = "kv-aid-${var.subscription}-01"
  resource_group_name = "rg-aid-${var.subscription}-01"
}

data "azurerm_private_dns_zone" "psql" {
  name                = "privatelink.postgres.database.azure.com"
  resource_group_name = "rg-aid-${var.subscription}-01"
}