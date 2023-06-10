variable "name" {
  description = "Name of the Azure Function App"
  type        = string
}

variable "location" {
  description = "Location for the Azure Function App"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "app_service_plan_name" {
  description = "Name of the Azure App Service Plan"
  type        = string
}

variable "app_settings" {
  description = "Additional app settings for the Function App"
  type        = map(string)
  default     = {}
}
