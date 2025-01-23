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
