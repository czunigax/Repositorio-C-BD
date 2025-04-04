resource azurerm_mssql_server "mssql" {
    name = "dbserver-${var.name_Project}-${var.enviroment}"
    resource_group_name = azurerm_resource_group.rgproyecto.name
    location = var.location
    version = "12.0"
    administrator_login = "sqladmin"
    administrator_login_password = var.administrator_login_password
    tags = var.tags
}

resource "azurerm_mssql_database" "db" {
    name = "${var.name_Project}db"
    server_id = azurerm_mssql_server.mssql.id
    sku_name = "S0"
    tags = var.tags
  
}