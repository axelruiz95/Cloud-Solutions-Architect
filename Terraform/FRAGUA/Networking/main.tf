##Plantilla Networking
#
#provider "azurerm" {
#  subscription_id = var.subscription_id
#  features {}
#}
#
#resource "azurerm_resource_group" "fragua_terraform" {
#  name     = var.resource_group_name
#  location = var.location
#}
#
## Crear una red virtual
#resource "azurerm_virtual_network" "fragua_terraform" {
#  name                = "vnet-fragua"
#  address_space       = ["10.0.0.0/16"]
#  location            = azurerm_resource_group.fragua_terraform.location
#  resource_group_name = azurerm_resource_group.fragua_terraform.name
#}
#
##Crear Subredes (Subnets)
#resource "azurerm_subnet" "fragua_subnet" {
#  name                 = "subnet-fragua"
#  resource_group_name  = azurerm_resource_group.fragua_terraform.name
#  virtual_network_name = azurerm_virtual_network.fragua_terraform.name
#  address_prefixes     = ["10.0.1.0/24"]
#}
#
##Configurar Grupos de Seguridad de Red
#resource "azurerm_network_security_group" "fragua_nsg" {
#  name                = "nsg-fragua"
#  location            = azurerm_resource_group.fragua_terraform.location
#  resource_group_name = azurerm_resource_group.fragua_terraform.name
#
#  security_rule {
#    name                       = "Allow-SSH"
#    priority                   = 100
#    direction                  = "Inbound"
#    access                     = "Allow"
#    protocol                   = "Tcp"
#    source_port_range          = "*"
#    destination_port_range     = "22"
#    source_address_prefix      = "*"
#    destination_address_prefix = "*"
#  }
#}
#
##Asociar NSG a subnet
#resource "azurerm_subnet_network_security_group_association" "fragua_nsg_association" {
#  subnet_id                 = azurerm_subnet.fragua_subnet.id
#  network_security_group_id = azurerm_network_security_group.fragua_nsg.id
#}
#
##Configurar Direcciones IP Públicas
#resource "azurerm_public_ip" "fragua_public_ip" {
#  name                = "public-ip-fragua"
#  location            = azurerm_resource_group.fragua_terraform.location
#  resource_group_name = azurerm_resource_group.fragua_terraform.name
#  allocation_method   = "Static"
#}
#
#Configurar DNS
#resource "azurerm_virtual_network" "fragua_terraform" {
#  name                = "vnet-fragua"
#  address_space       = ["10.0.0.0/16"]
#  location            = azurerm_resource_group.fragua_terraform.location
#  resource_group_name = azurerm_resource_group.fragua_terraform.name
#  dns_servers         = ["8.8.8.8", "1.1.1.1"]
#}
#
