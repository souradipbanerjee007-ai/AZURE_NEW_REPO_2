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

variable "key_vaults" {
  type        = map(map(string))
  description = "Map of applications with flat map(string) configurations for Key Vault."
  default = {}
}