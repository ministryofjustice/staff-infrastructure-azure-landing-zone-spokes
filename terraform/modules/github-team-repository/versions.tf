terraform {
  experiments = [ module_variable_optional_attrs ]
  required_providers {

    github = {
      source  = "integrations/github"
      version = "4.19.2"
    }
  }

  required_version = "1.1.4"

}

#From looking at the code, It seems that you need organization instead of owner
provider "github" {
 # token = var.github_token # may as well go with environment variables for both
  owner = "ministryofjustice" # This does not work. you need an environment variable
}

