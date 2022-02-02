variable "ado_token" {}

variable "github_token" {}

variable "spoke" {
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
}



