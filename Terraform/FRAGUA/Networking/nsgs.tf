
#Configurar Grupos de Seguridad de Red
resource "azurerm_network_security_group" "fragua_nsg" {
  name                = "nsg-fragua"
  location            = azurerm_resource_group.fragua_terraform.location
  resource_group_name = azurerm_resource_group.fragua_terraform.name

  security_rule {
    name                       = "Allow-SSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

#Asociar NSG a subnet
resource "azurerm_subnet_network_security_group_association" "fragua_nsg_association" {
  subnet_id                 = azurerm_subnet.fragua_subnet.id
  network_security_group_id = azurerm_network_security_group.fragua_nsg.id
}