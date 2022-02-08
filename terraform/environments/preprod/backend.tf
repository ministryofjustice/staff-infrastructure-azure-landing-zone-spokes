terraform {
  backend "azurerm" {
    storage_account_name = "samojtfstate002"
    resource_group_name  = "rg-prep-tfstate-001"
    key                  = "staff-infrastructure-azure-landing-zone-apps.tfstate"
    container_name       = "tfstate"
  }
}
