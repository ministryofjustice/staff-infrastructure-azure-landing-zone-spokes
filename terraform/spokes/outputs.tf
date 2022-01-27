output "ado_project_id" {
  value = { for k, v in azuredevops_project.project : k => azuredevops_project.project[k].id }
}
