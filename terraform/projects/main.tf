resource "azuredevops_project" "project" {
  for_each    = var.projects
  name        = each.key
  description = each.value.project_description
  visibility  = "private"
}

resource "github_repository" "spoke_repo" {
  for_each               = local.repository_details
  name                   = each.value.name
  description            = each.value.description
  delete_branch_on_merge = each.value.delete_branch_on_merge
  archive_on_destroy     = each.value.archive_on_destroy
  has_projects           = each.value.has_projects
  vulnerability_alerts   = each.value.vulnerability_alerts
  visibility             = each.value.visibility

  template {
    owner      = "ministryofjustice"
    repository = "azure-landing-zone-spoke-template"
  }
}

locals {
  repository_details = { for repo in var.projects : repo.repository_details.name => defaults(repo.repository_details, {
    archive_on_destroy     = true
    delete_branch_on_merge = true
    has_projects           = false
    team_permission        = "admin"
    visibility             = "public"
    vulnerability_alerts   = true
  }) }
}



