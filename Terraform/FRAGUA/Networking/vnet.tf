# Crear una red virtual
resource "azurerm_virtual_network" "fragua_terraform" {
  name                = "vnet-fragua"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.fragua_terraform.location
  resource_group_name = azurerm_resource_group.fragua_terraform.name
}