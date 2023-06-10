# Function App Module
resource "azurerm_app_service_plan" "app_service_plan" {
  name                = var.app_service_plan_name
  location            = var.location
  resource_group_name = var.resource_group_name
  kind                = "Linux"

  sku {
    tier = "Basic"
    size = "Y1"
  }
}

resource "azurerm_application_insights" "app_insights" {
  name                = "${var.name}-app-insights"
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_storage_account" "storage_account" {
  name                     = "${var.name}storage"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_function_app" "functionapp" {
  name                      = var.name
  location                  = var.location
  resource_group_name       = var.resource_group_name
  app_service_plan_id       = azurerm_app_service_plan.app_service_plan.id
  storage_account_name      = azurerm_storage_account.storage_account.name
  app_settings              = var.app_settings
  version                   = "~3"
  os_type                   = "Linux"
  app_service_environment   = ""
  application_insights {
    instrumentation_key = azurerm_application_insights.app_insights.instrumentation_key
  }
}
