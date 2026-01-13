resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-aid-${var.subscription}-01"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = var.vnet_address_space

  dns_servers = [
    "10.7.136.4",
    "10.14.136.4"
  ]

  dynamic "subnet" {
    for_each = var.subnets
    content {
      name             = subnet.value.name
      address_prefixes = subnet.value.address_prefixes
      security_group   = lookup(subnet.value, "security_group", null)
      route_table_id   = azurerm_route_table.rt.id

      dynamic "delegation" {
        for_each = lookup(subnet.value, "service_delegation", null) != null ? [1] : []
        content {
          name = subnet.value.service_delegation.name

          service_delegation {
            name    = subnet.value.service_delegation.name
            actions = subnet.value.service_delegation.actions
          }
        }
      }
    }
  }

}