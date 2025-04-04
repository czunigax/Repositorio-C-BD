resource "azurerm_app_service" "backend_api" {
  name                = "api-${var.name_Project}-${var.enviroment}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rgproyecto.name  
  app_service_plan_id = azurerm_service_plan.spproyecto.id      
  app_settings = {
    "Redis__ConnectionString" = "tu_cadena_de_conexion_redis"
  }

  site_config {
    linux_fx_version = "DOTNETCORE|6.0"  # Para Linux con .NET 6
    always_on        = false
  }

  identity {
    type = "SystemAssigned"
  }
}