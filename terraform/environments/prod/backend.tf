terraform {
  backend "azurerm" {
    storage_account_name = "samojtfstate003"
    resource_group_name  = "rg-prod-tfstate-001"
    key                  = "staff-infrastructure-azure-landing-zone-apps.tfstate"
    container_name       = "tfstate"
  }
}
