# Azure VM Module

This module creates an Azure Virtual Machine along with associated resources like:

- Resource Group
- Virtual Network
- Subnet
- Network Interface

## Inputs

| Variable             | Description                                | Type   | Default         | Required |
|----------------------|--------------------------------------------|--------|-----------------|----------|
| resource_group_name  | The name of the resource group             | string | n/a             | Yes      |
| location             | Azure region                              | string | eastus          | No       |
| vnet_name            | Virtual network name                      | string | n/a             | Yes      |
| vnet_address_space   | Address space for the virtual network      | string | n/a             | Yes      |
| subnet_name          | Subnet name                               | string | n/a             | Yes      |
| subnet_address_prefix| Address prefix for the subnet              | string | n/a             | Yes      |
| nic_name             | Network interface name                    | string | n/a             | Yes      |
| vm_name              | Virtual machine name                      | string | n/a             | Yes      |
| vm_size              | Virtual machine size                      | string | Standard_DS1_v2 | No       |
| admin_username       | Administrator username                    | string | n/a             | Yes      |
| admin_password       | Administrator password                    | string | n/a             | Yes      |
| os_disk_type         | Type of OS disk                           | string | Standard_LRS    | No       |

## Outputs

| Output          | Description                                |
|-----------------|--------------------------------------------|
| vm_id           | The ID of the virtual machine             |
| vm_ip           | The private IP address of the VM          |
| resource_group_name | The name of the resource group         |

## Usage

```hcl
module "azure_vm" {
  source              = "./modules/azure-vm"
  resource_group_name = "my-rg"
  location            = "eastus"
  vnet_name           = "my-vnet"
  vnet_address_space  = "10.0.0.0/16"
  subnet_name         = "my-subnet"
  subnet_address_prefix = "10.0.1.0/24"
  nic_name            = "my-nic"
  vm_name             = "my-vm"
  vm_size             = "Standard_B2s"
  admin_username      = "azureuser"
  admin_password      = "MySecurePassword123!"
}
