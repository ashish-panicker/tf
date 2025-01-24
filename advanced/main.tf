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

locals {
  vms = [
    { name = "my-vm1", vnet_name = "my-vnet-1", nic_name = "my-nic-1" },
    { name = "my-vm2", vnet_name = "my-vnet-2", nic_name = "my-nic-2" },
    { name = "my-vm3", vnet_name = "my-vnet-3", nic_name = "my-nic-3" }
  ]
}

# Call the Azure VM module
module "azure_vm" {
  source = "./modules/vm"

  # Module inputs
  for_each = {
    for index, vm in local.vms : vm.name => vm
  }
  resource_group_name   = "my-resource-group"
  location              = "eastus"
  vnet_name             = each.value.vnet_name
  vnet_address_space    = "10.0.0.0/16"
  subnet_name           = "my-subnet"
  subnet_address_prefix = "10.0.1.0/24"
  nic_name              = each.value.nic_name
  vm_name               = each.value.name
  vm_size               = "Standard_B2s"
  admin_username        = "azureuser"
  admin_password        = "MySecurePassword123!"
}


# Output the VM's public IP and resource group name
output "vm_ip" {
  description = "The private IP address of the Azure VM"
  value       = values(module.azure_vm)[*].vm_ip # Splat notation
}

output "resource_group" {
  description = "The name of the resource group"
  value       = values(module.azure_vm)[*].resource_group_name
}

output "vm_computer_name" {
  description = "The ID of the virtual machine"
  value       = values(module.azure_vm)[*].vm_computer_name
}
