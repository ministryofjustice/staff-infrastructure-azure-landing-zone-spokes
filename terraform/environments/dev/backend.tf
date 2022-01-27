terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-statefiles-001"
    storage_account_name = "samojtfstate001"
    key                  = "staff-infrastructure-azure-landing-zone-apps.tfstate"
    container_name       = "tfstate"
  }
}
