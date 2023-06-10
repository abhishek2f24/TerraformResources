# Global Variables
location            = "your-location"
resource_group_name = "your-resource-group"

# Function App 1
functionapp_name_1                  = "functionapp1"
functionapp_location_1              = "your-location"
functionapp_app_service_plan_id_1   = module.functionapp.app_service_plan_id
functionapp_storage_account_name_1  = module.functionapp.storage_account_name
functionapp_app_settings_1          = {
  "Setting1" = "Value1"
  "Setting2" = "Value2"
}

# Function App 2
functionapp_name_2                  = "functionapp2"
functionapp_location_2              = "your-location"
functionapp_app_service_plan_id_2   = module.functionapp.app_service_plan_id
functionapp_storage_account_name_2  = module.functionapp.storage_account_name
functionapp_app_settings_2          = {
  "Setting1" = "Value1"
  "Setting2" = "Value2"
}

# Web App 1
webapp_name_1                       = "webapp1"
webapp_location_1                   = "your-location"
webapp_app_service_plan_name_1      = module.webapp.app_service_plan_name
webapp_app_insights_instrumentation_key_1 = module.webapp.app_insights_instrumentation_key
webapp_storage_account_name_1       = module.webapp.storage_account_name
webapp_app_settings_1               = {
  "Setting1" = "Value1"
  "Setting2" = "Value2"
}

# Web App 2
webapp_name_2                       = "webapp2"
webapp_location_2                   = "your-location"
webapp_app_service_plan_name_2      = module.webapp.app_service_plan_name
webapp_app_insights_instrumentation_key_2 = module.webapp.app_insights_instrumentation_key
webapp_storage_account_name_2       = module.webapp.storage_account_name
webapp_app_settings_2               = {
  "Setting1" = "Value1"
  "Setting2" = "Value2"
}

# Stream Analytics Job
stream_analytics_name               = "streamanalyticsjob"
stream_analytics_location           = "your-location"
