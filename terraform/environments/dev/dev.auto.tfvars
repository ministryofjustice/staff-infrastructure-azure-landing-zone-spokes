applications = {
  "staff-infrastructure-testspoke" = {
    app_display_name         = "MoJO-DEVL-TestSpoke-LandingZone"
    create_password          = true
    owners                   = []
    required_resource_access = []
    role_assignments = [
      {
        id        = "Testing_Contributor_n_Resource_Lock",
        role_name = "MoJO - LandingZone - Role - Contributor and resource lock",
        scope     = "/subscriptions/4b068872-d9f3-41bc-9c34-ffac17cf96d6",
      }
    ]
    service_endpoint_name = "scDevTest"
    subscription_id       = "4b068872-d9f3-41bc-9c34-ffac17cf96d6"
    subscription_name     = "MoJ-OFFICIAL-Devl-Spoke-Testing"
  }
}

tenant_id = "0bb413d7-160d-4839-868a-f3d46537f6af"
