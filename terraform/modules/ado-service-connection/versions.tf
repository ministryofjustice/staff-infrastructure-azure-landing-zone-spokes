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
    random = {
      version = "3.1.0"
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

provider "azuredevops" {

  org_service_url = "https://dev.azure.com/MoJ-OFFICIAL/"
  personal_access_token = var.ado_token

}