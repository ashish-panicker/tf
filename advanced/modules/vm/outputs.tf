output "vm_id" {
  description = "The ID of the virtual machine"
  value       = azurerm_windows_virtual_machine.vm.id
}

output "vm_computer_name" {
  description = "The ID of the virtual machine"
  value       = azurerm_windows_virtual_machine.vm.computer_name
}

output "vm_ip" {
  description = "The private IP address of the virtual machine"
  value       = azurerm_network_interface.vm_nic.private_ip_address
}

output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.vm_rg.name
}
