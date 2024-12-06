# Configurar el proveedor de Azure
provider "azurerm" {
  features {}
  subscription_id = "81e6b7d4-825d-4409-a3ba-d3afe25f74e4"
}

# Crear un grupo de recursos
resource "azurerm_resource_group" "axel_terraform" {
  name     = "axel_terraform"
  location = "East US"
}

# Crear una red virtual
resource "azurerm_virtual_network" "axel_terraform" {
  name                = "red-prueba"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.axel_terraform.location
  resource_group_name = azurerm_resource_group.axel_terraform.name
}
