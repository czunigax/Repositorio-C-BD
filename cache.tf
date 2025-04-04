# cache.tf: Configuración de la capa de caché (Azure Redis Cache)

resource "azurerm_redis_cache" "redis_cache" {
  name = "rediscache-${var.name_Project}-${var.enviroment}"
  location = var.location
  resource_group_name = azurerm_resource_group.rgproyecto.name
  sku_name = "Basic"           # Asegúrate de especificar el SKU
  family = "C"               # Familia C para caché estándar
  capacity = 1                  # Nivel de capacidad, 1 es el valor mínimo
  tags = var.tags
}


