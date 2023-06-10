# Web App Module
resource "azurerm_app_service_plan" "app_service_plan" {
  name                = var.app_service_plan_name
  location            = var.location
  resource_group_name = var.resource_group_name
  kind                = "Windows"

  sku {
    tier = "Standard"
    size = "S1"
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

resource "azurerm_app_service" "webapp" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.app_service_plan.id

  site_config {
    dotnet_framework_version = "v5.0"
    scm_type                 = "LocalGit"
    always_on                = true
  }

  app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY" = azurerm_application_insights.app_insights.instrumentation_key
    "STORAGE_ACCOUNT"                = azurerm_storage_account.storage_account.name
  }
}
