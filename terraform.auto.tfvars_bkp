# Global / Resource Group
resource_group_name = "rg-workload-prod-01"
location            = "eastus"
tags = {
  Environment = "Production"
  ManagedBy   = "Terraform"
  Project     = "Workload-Host"
}

# Networking
vnet_name                   = "vnet-workload-prod-01"
vnet_address_space          = ["10.10.0.0/16"]
subnet_name                 = "snet-workload-app-01"
subnet_address_prefixes     = ["10.10.1.0/24"]
public_ip_name              = "pip-workload-vm-01"
public_ip_allocation_method = "Static"
public_ip_sku               = "Standard"
nsg_name                    = "nsg-workload-vm-01"
ssh_source_address_prefix   = "*" # Change to your actual IP in CIDR format (e.g., "198.51.100.4/32") for production security

# Network Interface
nic_name           = "nic-workload-vm-01"
nic_ip_config_name = "ipconfig-primary"

# Linux VM Configuration
vm_name         = "vm-ubuntu-prod-01"
vm_size         = "Standard_B2s"
admin_username  = "azureuser"
admin_password  = "Demopass@2026"

# OS Disk
os_disk_name                 = "osdisk-ubuntu-prod-01"
os_disk_caching              = "ReadWrite"
os_disk_storage_account_type = "Premium_LRS"
os_disk_size_gb              = 30

# Image Spec (Ubuntu 22.04 LTS Gen2)
image_publisher = "Canonical"
image_offer     = "0001-com-ubuntu-server-jammy"
image_sku       = "22_04-lts-gen2"
image_version   = "latest"

# Data Disk
data_disk_name                 = "datadisk-ubuntu-prod-01"
data_disk_storage_account_type = "Premium_LRS"
data_disk_create_option        = "Empty"
data_disk_size_gb              = 64
data_disk_lun                  = 10
data_disk_caching              = "ReadWrite"