# Define the requires providers
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}
# Provider
provider "azurerm" {
  features {}
}


# Create a resource group
resource "azurerm_resource_group" "rg" {
  location = var.rg_location
  name     = var.rg_name
}
