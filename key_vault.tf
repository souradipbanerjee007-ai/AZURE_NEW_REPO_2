resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv" {
  for_each = var.key_vaults

  # lookup(): extract explicit name or generate a fallback from each.key
  name = lookup(each.value, "name", "kv-${each.key}-default")

  # lookup(): if location is not specified in the map, fallback to resource group's location
  location = lookup(each.value, "location", azurerm_resource_group.rg.location)

  resource_group_name = azurerm_resource_group.rg.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"

  # try() + lookup() + tonumber(): convert string to number safely, fallback to 7 days
  soft_delete_retention_days = try(
    tonumber(lookup(each.value, "soft_delete_retention_days", "7")),
    7
  )

  # try() + lookup() + tobool(): convert string to bool safely, fallback to true
  purge_protection_enabled = try(
    tobool(lookup(each.value, "purge_protection_enabled", "false")),
    false
  )

  enable_rbac_authorization = true

  network_acls {
    bypass = "AzureServices"
    # lookup(): default network action to 'Allow' if not specified
    default_action = lookup(each.value, "network_default_action", "Allow")
  }

  tags = {
    Application = each.key
    # lookup(): tag fallback to 'dev' if environment key is missing
    Environment = lookup(each.value, "environment", "dev")
    ManagedBy   = "Terraform"
  }
}

# Example: Granting Key Vault Administrator to the deploying client across all 3 vaults
resource "azurerm_role_assignment" "kv_admin" {
  for_each = azurerm_key_vault.kv

  scope                = each.value.id
  role_definition_name = "Key Vault Administrator"
  principal_id         = data.azurerm_client_config.current.object_id
}

/*
# Standard Software-Protected Cryptographic Key
resource "azurerm_key_vault_key" "app_key" {
  for_each = azurerm_key_vault.kv

  name         = "data-encryption-key"
  key_vault_id = each.value.id
  key_type     = "RSA"
  key_size     = 2048

  key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey"
  ]
} 
*/
