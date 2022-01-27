terraform {
  required_providers {
    azuread = {
      version = "2.6.0"
    }
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = "0.1.8"
    }
    azurerm = {
      version = "2.92.0"
    }
    time = {
      version = "0.7.0"
    }

  }

  required_version = "1.1.4"
}

provider "azuread" {
  tenant_id = var.tenant_id
}

provider "azurerm" {
  features {}
}