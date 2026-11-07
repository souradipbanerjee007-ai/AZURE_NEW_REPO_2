resource_group_name = "rg-workload-prod-01"
location            = "eastus"
tags = {
  Environment = "Production"
  ManagedBy   = "Terraform"
  Project     = "Workload-Host"
}

key_vaults = {
    "app1" = {
      name                       = "kv-payment-prod-01"
      location                   = "eastus"
      environment                = "production"
      soft_delete_retention_days = "7"
      purge_protection_enabled   = "false"
      network_default_action     = "Deny"
    }
    "app2" = {
      name        = "kv-app-billing-prod-01"
      location    = "eastus2"
      environment = "production"
      # soft_delete_retention_days omitted -> will fallback via lookup/try
      # purge_protection_enabled omitted   -> will fallback via lookup/try
    }
    "app3" = {
      name        = "kv-app-identity-prod-01"
      environment = "staging"
      # location omitted -> will fallback to RG location via lookup
    }
  }