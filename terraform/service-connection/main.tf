#This makes sure that the project exists
data "azuredevops_project" "project" {
  for_each = var.applications
  name     = each.key
}

module "service-connection" {
  for_each                 = var.applications
  source                   = "../../modules/ado-service-connection"
  ado_project_name         = each.key
  app_display_name         = each.value.app_display_name
  create_password          = each.value.create_password
  owners                   = each.value.owners
  required_resource_access = each.value.required_resource_access
  role_assignments         = each.value.role_assignments
  service_endpoint_name    = each.value.service_endpoint_name
  tenant_id                = var.tenant_id
  subscription_id          = each.value.subscription_id
  subscription_name        = each.value.subscription_name
}
