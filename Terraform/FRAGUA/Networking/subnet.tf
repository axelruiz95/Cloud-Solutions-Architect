#Crear Subredes (Subnets)
resource "azurerm_subnet" "fragua_subnet" {
  name                 = "subnet-fragua"
  resource_group_name  = azurerm_resource_group.fragua_terraform.name
  virtual_network_name = azurerm_virtual_network.fragua_terraform.name
  address_prefixes     = ["10.0.1.0/24"]
}