resource "azurerm_resource_group" "fragua_terraform" {
  name     = var.resource_group_name
  location = var.location
}
