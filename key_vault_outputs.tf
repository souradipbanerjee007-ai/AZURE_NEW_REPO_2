output "resource_group_name" {
  description = "The deployed Resource Group name."
  value       = azurerm_resource_group.rg.name
}

output "key_vault_uris" {
  description = "URIs for the provisioned Key Vaults mapped by app key."
  value = {
    for k, v in azurerm_key_vault.kv : k => v.vault_uri
  }
}

output "key_vault_ids" {
  description = "Resource IDs for the provisioned Key Vaults."
  value = {
    for k, v in azurerm_key_vault.kv : k => v.id
  }
}