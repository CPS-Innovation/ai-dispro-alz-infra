provider "azapi" {}
resource "azapi_resource" "res-0" {
  body = {
    kind = "AIServices"
    properties = {
      allowProjectManagement = true
      apiProperties = {
        qnaAzureSearchEndpointKey = null
      }
      associatedProjects  = ["proj-default"]
      customSubDomainName = "saifound3"
      defaultProject      = "proj-default"
      networkAcls = {
        defaultAction       = "Allow"
        ipRules             = []
        virtualNetworkRules = []
      }
      publicNetworkAccess = "Enabled"
    }
    sku = {
      name = "S0"
    }
  }
  ignore_casing             = false
  ignore_missing_property   = true
  ignore_null_property      = false
  location                  = "uksouth"
  name                      = "saifound3"
  parent_id                 = "/subscriptions/422e7966-394c-4668-8e78-67e68c3c32a5/resourceGroups/test03"
  schema_validation_enabled = true
  type                      = "Microsoft.CognitiveServices/accounts@2025-06-01"
  identity {
    identity_ids = []
    type         = "SystemAssigned"
  }
}


/*

resource "azurerm_ai_services" "foundry" {
  name                = "aif-aid-${var.environment}-02"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku_name            = "S0"

  custom_subdomain_name = "aif-aid-${var.environment}"

  public_network_access = "Enabled"
  network_acls {
    default_action = "Allow"
    ip_rules       = []
  }

  identity {
    type = "SystemAssigned"
  }
}

# Enable project management for AI Foundry
resource "azapi_resource_action" "ai_foundry_project_management" {
  type        = "Microsoft.CognitiveServices/accounts@2025-04-01-preview"
  resource_id = azurerm_ai_services.foundry.id
  method      = "PATCH"

  body = {
    properties = {
      allowProjectManagement = true
    }
  }
}

# Create default project
resource "azapi_resource" "ai_foundry_project" {
  type      = "Microsoft.CognitiveServices/accounts/projects@2025-06-01"
  name      = "fproj-aid-${var.environment}-02"
  parent_id = azurerm_ai_services.foundry.id
  location  = azurerm_resource_group.rg.location

  identity {
    type = "SystemAssigned"
  }

  body = {
    properties = {
      displayName = "AI Foundry Default Project"
      description = "Default AI Foundry project for ${var.environment}"
    }
  }

  depends_on = [
    azapi_resource_action.ai_foundry_project_management
  ]
}

/*

resource "azurerm_ai_foundry" "foundry_hub" {
  name                = "fhub-aid-${var.environment}-01"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  storage_account_id  = azurerm_storage_account.aidds_sa.id
  key_vault_id        = data.azurerm_key_vault.kv_aid.id

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_ai_foundry_project" "foundry_project" {
  name               = "fhubproj-aid-${var.environment}-01"
  location            = azurerm_resource_group.rg.location
  ai_services_hub_id = azurerm_ai_foundry.foundry_hub.id
}

*/