# Stream Analytics Module
resource "azurerm_stream_analytics_job" "stream_analytics" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku {
    name     = "Standard"
    capacity = 1
  }

  output {
    name = "outputBlob"
    datasource {
      type            = "Microsoft.Storage/Blob"
      properties {
        storageAccounts {
          accountName  = azurerm_storage_account.storage_account.name
          accountKey   = azurerm_storage_account.storage_account.primary_access_key
        }
        container     = "outputcontainer"
        pathPattern   = "{date}/{time}"
        dateFormat    = "yyyyMMdd"
        timeFormat    = "HHmm"
      }
    }
  }

  input {
    name = "inputBlob"
    datasource {
      type            = "Microsoft.Storage/Blob"
      properties {
        storageAccounts {
          accountName  = azurerm_storage_account.storage_account.name
          accountKey   = azurerm_storage_account.storage_account.primary_access_key
        }
        container     = "inputcontainer"
        pathPattern   = "{date}/{time}"
        dateFormat    = "yyyyMMdd"
        timeFormat    = "HHmm"
      }
    }
  }

  query {
    name   = "sampleQuery"
    query  = "SELECT * INTO outputBlob FROM inputBlob"
    inputs = ["inputBlob"]
    outputs = ["outputBlob"]
  }
}
