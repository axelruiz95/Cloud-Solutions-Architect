#Plantilla archivos Load Balancer

provider "azurerm" {
  subscription_id = var.subscription_id
  features {}
}

#Crear el Grupo de Recursos (si no lo tienes).
resource "azurerm_resource_group" "fragua_loadbalancer_terraform" {
  name     = var.resource_group_name
  location = var.location
}

#Definir el Tipo de Load Balancer Público

resource "azurerm_public_ip" "lb_public_ip" {
  name                = "lb-public-ip"
  location            = azurerm_resource_group.fragua_loadbalancer_terraform.location
  resource_group_name = azurerm_resource_group.fragua_loadbalancer_terraform.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_lb" "public_lb" {
  name                = "public-lb"
  location            = azurerm_resource_group.fragua_loadbalancer_terraform.location
  resource_group_name = azurerm_resource_group.fragua_loadbalancer_terraform.name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "public-frontend"
    public_ip_address_id = azurerm_public_ip.lb_public_ip.id
  }
}

#Definir el Tipo de Load Balancer Interno
resource "azurerm_lb" "internal_lb" {
  name                = "internal-lb"
  location            = azurerm_resource_group.fragua_loadbalancer_terraform.location
  resource_group_name = azurerm_resource_group.fragua_loadbalancer_terraform.name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "internal-frontend"
    private_ip_address   = "10.0.1.10" # Cambia según el rango de tu subred
    private_ip_address_allocation = "Static"
    subnet_id            = azurerm_subnet.fragua_subnet.id
  }
}


#Crear el Load Balancer (y seleccionar una IP pública o privada).
resource "azurerm_lb_backend_address_pool" "public_backend_pool" {
  name                = "public-backend-pool"
  loadbalancer_id     = azurerm_lb.public_lb.id
}

resource "azurerm_lb_backend_address_pool" "internal_backend_pool" {
  name                = "internal-backend-pool"
  loadbalancer_id     = azurerm_lb.internal_lb.id
}

#Configurar las Reglas de Balanceo de Carga para distribuir el tráfico.
resource "azurerm_lb_rule" "public_lb_rule" {
  name                            = "http-rule"
  loadbalancer_id                 = azurerm_lb.public_lb.id
  protocol                        = "Tcp"
  frontend_port                   = 80
  backend_port                    = 80
  frontend_ip_configuration_name  = "public-frontend"
  backend_address_pool_ids = [azurerm_lb_backend_address_pool.public_backend_pool.id]
}

resource "azurerm_lb_rule" "internal_lb_rule" {
  name                            = "tcp-rule"
  loadbalancer_id                 = azurerm_lb.internal_lb.id
  protocol                        = "Tcp"
  frontend_port                   = 1433
  backend_port                    = 1433
  frontend_ip_configuration_name  = "internal-frontend"
  backend_address_pool_ids = [azurerm_lb_backend_address_pool.public_backend_pool.id]

}

#Probar y Verificar la configuración.

