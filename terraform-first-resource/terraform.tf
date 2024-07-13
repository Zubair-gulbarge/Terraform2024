provider "github" {
  token = "*****************************" # put the actual values here.
}

resource "github_repository" "terraform-first-repo" {
  name        = "first-repo-from-terraform"
  description = "My First resource to test terraform plugin."
  visibility = "public"
  auto_init = true
}