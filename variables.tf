variable "resource_group_name" {
  type        = string
  description = "Name of the target Azure resource group."
}

variable "location" {
  type        = string
  description = "Azure region where all resources will be created."
}

variable "tags" {
  type        = map(string)
  description = "Resource tags applied across all deployed components."
  default     = {}
}

# Networking Variables
variable "vnet_name" {
  type        = string
  description = "Name of the Virtual Network."
}

variable "vnet_address_space" {
  type        = list(string)
  description = "Address prefixes for the Virtual Network."
}

variable "subnet_name" {
  type        = string
  description = "Name of the subnet hosting the VM."
}

variable "subnet_address_prefixes" {
  type        = list(string)
  description = "Address prefix list for the VM subnet."
}

variable "public_ip_name" {
  type        = string
  description = "Name of the Public IP address resource."
}

variable "public_ip_allocation_method" {
  type        = string
  description = "Allocation method for the Public IP (Static or Dynamic)."
  default     = "Static"
}

variable "public_ip_sku" {
  type        = string
  description = "SKU for Public IP (Standard or Basic)."
  default     = "Standard"
}

variable "nsg_name" {
  type        = string
  description = "Name of the Network Security Group."
}

variable "ssh_source_address_prefix" {
  type        = string
  description = "CIDR allowed to connect to SSH port 22."
  default     = "*"
}

variable "nic_name" {
  type        = string
  description = "Name of the Network Interface."
}

variable "nic_ip_config_name" {
  type        = string
  description = "Internal configuration name for the NIC IP allocation."
  default     = "ipconfig-primary"
}

# Virtual Machine Variables
variable "vm_name" {
  type        = string
  description = "Name of the Linux Virtual Machine."
}

variable "vm_size" {
  type        = string
  description = "Azure VM compute SKU size."
}

variable "admin_username" {
  type        = string
  description = "Administrative login username for the VM."
}

variable "admin_password" {
  type        = string
  description = "Administrator password for the Linux VM."
  sensitive   = true
}

#variable "admin_ssh_public_key" {
#  type        = string
#  description = "SSH public key string for authentication."
#}

variable "os_disk_name" {
  type        = string
  description = "Name of the operating system disk."
}

variable "os_disk_caching" {
  type        = string
  description = "Caching requirements for OS Disk (ReadWrite, ReadOnly, None)."
  default     = "ReadWrite"
}

variable "os_disk_storage_account_type" {
  type        = string
  description = "Storage tier for OS Disk (Premium_LRS, StandardSSD_LRS, Standard_LRS)."
  default     = "Premium_LRS"
}

variable "os_disk_size_gb" {
  type        = number
  description = "Size of the OS disk in GB."
  default     = 30
}

# Image Reference Variables
variable "image_publisher" {
  type        = string
  description = "OS Image Publisher."
  default     = "Canonical"
}

variable "image_offer" {
  type        = string
  description = "OS Image Offer."
  default     = "0001-com-ubuntu-server-jammy"
}

variable "image_sku" {
  type        = string
  description = "OS Image SKU."
  default     = "22_04-lts-gen2"
}

variable "image_version" {
  type        = string
  description = "OS Image Version."
  default     = "latest"
}

# Managed Data Disk Variables
variable "data_disk_name" {
  type        = string
  description = "Name of the additional managed data disk."
}

variable "data_disk_storage_account_type" {
  type        = string
  description = "Storage tier for the Data Disk."
  default     = "Premium_LRS"
}

variable "data_disk_create_option" {
  type        = string
  description = "Creation method for Data Disk (Empty, Attach, etc.)."
  default     = "Empty"
}

variable "data_disk_size_gb" {
  type        = number
  description = "Size of the Data Disk in GB."
}

variable "data_disk_lun" {
  type        = number
  description = "Logical Unit Number (LUN) for disk attachment."
  default     = 10
}

variable "data_disk_caching" {
  type        = string
  description = "Caching behavior for the attached data disk."
  default     = "ReadWrite"
}