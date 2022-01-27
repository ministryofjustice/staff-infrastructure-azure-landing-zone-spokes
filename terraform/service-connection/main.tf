#This makes sure that the project exists
data "azuredevops_project" "project" {
  for_each = var.applications
  name = each.key
}

module "service-connection" {
  for_each                 = var.applications
  source                   = "../../modules/ado-service-connection"
  create_password          = each.value.create_password
  display_name             = each.value.display_name
  owners                   = each.value.owners
  project_name             = each.key
  service_endpoint_name    = each.value.service_endpoint_name
  tenant_id                = var.tenant_id
  subscription_id          = each.value.subscription_id
  subscription_name        = each.value.subscription_name
}
