resource "azurerm_storage_account" "function_sa" {
  name                     = "funcsa${lower(var.name_Project)}${lower(var.enviroment)}"
  resource_group_name      = azurerm_resource_group.rgproyecto.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version           = "TLS1_2"
}

resource "azurerm_service_plan" "function_plan" {
  name                = "funcplan-${lower(var.name_Project)}-${lower(var.enviroment)}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rgproyecto.name
  os_type             = "Linux"
  sku_name            = "B1"  
  tags                = var.tags
}

resource "azurerm_linux_function_app" "function_app" {
  name                       = "func-${lower(var.name_Project)}-${lower(var.enviroment)}"
  location                   = var.location
  resource_group_name        = azurerm_resource_group.rgproyecto.name
  service_plan_id            = azurerm_service_plan.function_plan.id
  storage_account_name       = azurerm_storage_account.function_sa.name
  storage_account_access_key = azurerm_storage_account.function_sa.primary_access_key

  identity {
    type = "SystemAssigned"
  }

  site_config {
    application_stack {
      dotnet_version = "6.0" 
    }
    
   
    always_on = false  
  }

  app_settings = {
    "FUNCTIONS_WORKER_RUNTIME"    = "dotnet"
    "AzureWebJobsStorage"         = azurerm_storage_account.function_sa.primary_connection_string
    "FUNCTIONS_EXTENSION_VERSION" = "~4"
    "WEBSITE_RUN_FROM_PACKAGE"    = "1"  # Mejora el rendimiento
  }
}
