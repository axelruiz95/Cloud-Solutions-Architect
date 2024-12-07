#Configurar Direcciones IP Públicas
resource "azurerm_public_ip" "fragua_public_ip" {
  name                = "public-ip-fragua"
  location            = azurerm_resource_group.fragua_terraform.location
  resource_group_name = azurerm_resource_group.fragua_terraform.name
  allocation_method   = "Static"
}