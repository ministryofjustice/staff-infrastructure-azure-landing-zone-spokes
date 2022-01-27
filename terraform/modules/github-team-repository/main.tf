data "github_team" "team" {
  slug     = var.team_slug
}

resource "github_team_repository" "some_team_repo" {
  team_id    = data.github_team.team.id
  repository = var.repo_name
  permission = var.team_permission
}