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

variable "vnet_name" {
  description = "vnet-fragua"
  type        = string
}

variable "vnet_address_space" {
  description = "10.0.0.0/16"
  type        = list(string)
}



