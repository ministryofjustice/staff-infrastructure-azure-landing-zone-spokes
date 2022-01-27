#This module has pretty much been ripped off the dso-infra-azure-ad repository with as few changes as possible


resource "azuread_application" "application" {
  display_name = var.display_name
  owners       = var.owners

  dynamic "required_resource_access" {
    for_each = var.required_resource_access
    content {
      resource_app_id = required_resource_access.value["resource_app_id"]

      dynamic "resource_access" {
        for_each = required_resource_access.value["resource_access"]
        content {
          id   = resource_access.value["id"]
          type = resource_access.value["type"]
        }
      }
    }
  }
}

resource "azuread_service_principal" "service_principal" {
  application_id               = azuread_application.application.application_id
  owners                       = var.owners
  app_role_assignment_required = false
}

resource "time_rotating" "duration" {
  count          = var.create_password ? 1 : 0
  rotation_hours = var.secret_duration
}

resource "azuread_application_password" "application_password" {
  count                 = var.create_password ? 1 : 0
  application_object_id = azuread_application.application.id
  display_name          = "CreatedByTerraform"
  rotate_when_changed = {
    rotation = time_rotating.duration[0].id
  }
}

resource "azurerm_role_assignment" "role_assignment" {
  scope                = "/subscriptions/${var.subscription_id}"
  role_definition_name = "MoJO - LandingZone - Role - Contributor and resource lock"
  principal_id         = azuread_service_principal.service_principal.object_id
}

data "azuredevops_project" "project" {
  name = var.project_name
}

resource "azuredevops_serviceendpoint_azurerm" "endpointazure" {
  project_id            = data.azuredevops_project.project.id
  service_endpoint_name = var.service_endpoint_name
  description = "Managed by Terraform"
  credentials {
    serviceprincipalid  = azuread_service_principal.service_principal.id
    serviceprincipalkey = azuread_application_password.application_password[0].value
  }
  azurerm_spn_tenantid      = var.tenant_id
  azurerm_subscription_id   = var.subscription_id
  azurerm_subscription_name = var.subscription_name
}
