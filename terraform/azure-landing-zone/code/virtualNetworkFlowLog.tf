
resource "azurerm_network_watcher" "nw" {
  name                = "nw-aid-${var.subscription}-01"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_network_watcher_flow_log" "flow_log" {
  network_watcher_name = azurerm_network_watcher.nw.name
  resource_group_name  = azurerm_resource_group.rg.name
  name                 = "nwflowlog-aid-${var.subscription}-01"

  target_resource_id = azurerm_virtual_network.vnet.id
  storage_account_id = azurerm_storage_account.sa.id
  enabled            = true

  retention_policy {
    enabled = true
    days    = 7
  }

  traffic_analytics {
    enabled               = true
    workspace_id          = azurerm_log_analytics_workspace.law.workspace_id
    workspace_region      = azurerm_log_analytics_workspace.law.location
    workspace_resource_id = azurerm_log_analytics_workspace.law.id
    interval_in_minutes   = 10
  }
}