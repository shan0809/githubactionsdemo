provider "azurerm" {
  features {}
}

variable "rg_prefix" {
  default = "rg"
}
resource "random_pet" "rg-name" {
  prefix = var.rg_prefix
}

variable "location" {
  default = "eastus"
}
resource "azurerm_resource_group" "rg" {
  location = var.location
  name = random_pet.rg-name.id
}

output "resource_group_location" {
  value = azurerm_resource_group.rg.name
}