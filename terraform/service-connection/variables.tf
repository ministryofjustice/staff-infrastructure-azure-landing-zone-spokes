variable "applications" {
  description = "A map of applications where the key is the app name"
  type = map(object({
    create_password = bool
    display_name    = string
    owners          = list(string)
    service_endpoint_name = string
    subscription_id       = string
    subscription_name     = string
  }))

  default = {}
}

variable "tenant_id" {
  description = "Tenant id"
}
