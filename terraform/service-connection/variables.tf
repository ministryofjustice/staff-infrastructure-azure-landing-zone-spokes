variable "ado_token" {
  type        = string
  sensitive   = true
  description = "This is the token used to connecto azure devops"
}
variable "applications" {
  description = "A map of applications where the key is the app name"
  type = map(object({
    app_display_name = string
    create_password  = bool
    owners           = list(string)
    required_resource_access = list(object({

      resource_app_id = string

      resource_access = list(object({
        id   = string
        type = string
      }))
    }))

    role_assignments = list(object({
      id        = string
      role_name = string
      scope     = string
    }))

    service_endpoint_name = string
    subscription_id       = string
    subscription_name     = string
  }))

  default = {}
}

variable "tenant_id" {
  description = "Tenant id"
}
