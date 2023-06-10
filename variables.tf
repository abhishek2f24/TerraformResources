variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "my-resource-group"
}

variable "location" {
  description = "Location for the resources"
  type        = string
  default     = "West Europe"
}

# Additional variables for the modules can be defined here as well.
