variable "subscription_id" {
  description = "81e6b7d4-825d-4409-a3ba-d3afe25f74e4"
  type        = string
}

variable "resource_group_name" {
  description = "fragua_terraform"
  type        = string
}

variable "location" {
  description = "Región de Azure"
  type        = string
  default     = "East US"
}

resource "azurerm_subnet" "fragua_subnet" {
  name                 = "fragua-subnet"
  resource_group_name  = azurerm_resource_group.fragua_loadbalancer_terraform.name
  virtual_network_name = azurerm_virtual_network.fragua_terraform.name
  address_prefixes     = ["10.0.1.0/24"]     # Ajusta según tus necesidades
}



