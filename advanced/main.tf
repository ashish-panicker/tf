
# Call the Azure VM module
module "azure_vm" {
  source = "./modules/vm"

  # Module inputs
  resource_group_name   = "my-resource-group"
  location              = "eastus"
  vnet_name             = "my-vnet"
  vnet_address_space    = "10.0.0.0/16"
  subnet_name           = "my-subnet"
  subnet_address_prefix = "10.0.1.0/24"
  nic_name              = "my-nic"
  vm_name               = "my-azure-vm"
  vm_size               = "Standard_B2s"
  admin_username        = "azureuser"
  admin_password        = "MySecurePassword123!"
}

# Output the VM's public IP and resource group name
output "vm_ip" {
  description = "The private IP address of the Azure VM"
  value       = module.azure_vm.vm_ip
}

output "resource_group" {
  description = "The name of the resource group"
  value       = module.azure_vm.resource_group_name
}

output "vm_computer_name" {
  description = "The ID of the virtual machine"
  value       = module.azure_vm.vm_computer_name
}
