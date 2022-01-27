variable "app_role" {
  description = <<EOT
  Roles that the application might define, see https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application_app_role for more details.
  Note that the assignments field doesn't really do anything at this point in time, but the hope is that it will be used for passing into a script that will sort them out
  EOT
  type = list(object({
    allowed_member_types = list(string)
    description          = string
    display_name         = string
    enabled              = bool
    value                = string,
    id                   = string
    assignments          = list(string)
  }))

  default = []

}

variable "display_name" {}

variable "owners" {
  description = "Who owns the app. Unless there is a good reason for this leave blank"
  type        = list(string)
  default     = null
}


variable "required_resource_access" {
  description = "This is the API Permissions field in the portal, essentially, I don't know look it up on google or something."
  type = list(object({
    resource_app_id = string
    resource_access = list(object({
      id   = string
      type = string
    }))
  }))

  default = []

}

variable "secret_duration" {
  description = "This is the duration of the secret, note that when this elapses terraform will create a new, however the code adds some leeway so that if the pipeline that renews the secret fails, it will continue to work during the grace period"
  default     = 672 # This is in hours, so equivalent to 28 days
}

variable "role_assignments" {
  description = "Assign azure RBAC Roles to the sp."
  type = list(object({
    id        = string
    role_name = string
    scope     = string
  }))

  default = []
}

variable "create_password" {
  type        = bool
  default     = true
  description = "Essentially this is a bit of a hack to allow us to import without having to create a password, e.g. if it already exists and it's stored elsewhere or you want, for some reason, create it manually."
}



variable "project_name" {}
variable "service_endpoint_name" {}

variable "tenant_id" {}
variable "subscription_id" {}
variable "subscription_name" {}
