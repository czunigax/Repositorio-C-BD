provider "azurerm" {
  subscription_id = var.subscription_id
  features {}
}

# Grupo de Recursos
resource "azurerm_resource_group" "rgproyecto" {
  name     = "rgp-${var.name_Project}-${var.enviroment}-proyecto"
  location = var.location
  tags     = var.tags
}


