terraform {
  required_version = ">=0.12"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}

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
  name     = random_pet.rg-name.id
}
resource "azurerm_resource_group" "rg1" {
  location = "north europe"
  name     = "createviapipeline"
}

output "resource_group_location" {
  value = azurerm_resource_group.rg.name
}