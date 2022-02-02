variable "ado_token" {
  type        = string
  sensitive   = true
  description = "This is the token used for the azure devops api (terraform provider)"
}

variable "github_token" {
  type        = string
  sensitive   = true
  description = "This is the token used for the github api (terraform provider)"
}

variable "projects" {
  type = map(object({
    project_description = string
    repository_details = object({
      archive_on_destroy     = optional(bool)
      description            = optional(string)
      delete_branch_on_merge = optional(bool)
      has_projects           = optional(bool)
      name                   = string
      team_slug              = optional(string)
      team_permission        = optional(string)
      vulnerability_alerts   = optional(bool)
      visibility             = optional(string)

    })
  }))
  description = "This contains details of the project and github repository for the project"
}



