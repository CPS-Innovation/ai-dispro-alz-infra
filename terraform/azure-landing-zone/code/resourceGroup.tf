resource "azurerm_resource_group" "rg" {
  name     = "rg-aidispro-${var.subscription}-01"
  location = var.location
}