output "resource_group_name" {
  description = "The deployed Resource Group name."
  value       = azurerm_resource_group.rg.name
}

output "vm_id" {
  description = "Resource ID of the Linux VM."
  value       = azurerm_linux_virtual_machine.vm.id
}

output "public_ip_address" {
  description = "Assigned public IP address for external SSH access."
  value       = azurerm_public_ip.pip.ip_address
}

output "private_ip_address" {
  description = "Private IP assigned to the primary NIC."
  value       = azurerm_network_interface.nic.private_ip_address
}

output "ssh_connect_command" {
  description = "Direct SSH shell command to connect to the VM."
  value       = "ssh ${var.admin_username}@${azurerm_public_ip.pip.ip_address}"
}