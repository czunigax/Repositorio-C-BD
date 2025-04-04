# caché (Azure Redis Cache)

resource "azurerm_redis_cache" "redis_cache" {
  name = "rediscache-${var.name_Project}-${var.enviroment}"
  location = var.location
  resource_group_name = azurerm_resource_group.rgproyecto.name
  sku_name = "Basic"   
  family = "C"            
  capacity = 1             
  tags = var.tags
}


