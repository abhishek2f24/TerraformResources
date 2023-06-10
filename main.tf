# Provider configuration for Azure
provider "azurerm" {
  features {}
}

# Resource Group
resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

# Modules
module "webapp_module" {
  source              = "./modules/webapp"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  app_service_plan_id = module.webapp_module.app_service_plan_id
}

module "functionapp_module" {
  source              = "./modules/functionapp"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  app_service_plan_id = module.functionapp_module.app_service_plan_id
}

module "streamanalytics_module" {
  source              = "./modules/streamAnalytics"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
}
