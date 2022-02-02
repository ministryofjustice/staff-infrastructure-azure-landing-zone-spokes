terraform {
  experiments = [module_variable_optional_attrs]
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
    github = {
      source  = "integrations/github"
      version = "4.19.2"
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

#From looking at the code, It seems that you need organization instead of owner
provider "github" {
  token = var.github_token    # may as well go with environment variables for both
  owner = "ministryofjustice" # This does not work. you need an environment variable
}

provider "azuredevops" {
  org_service_url       = "https://dev.azure.com/MoJ-OFFICIAL/"
  personal_access_token = var.ado_token
}
