# terraform {
#   required_providers {
#     google = {
#       source  = "hashicorp/google"
#       version = "~> 3.50"
#     }
#     github = {
#       source  = "hashicorp/github"
#       version = "~> 4.1"
#     }
#   }

#   backend "remote" {
#     organization = "7L-tf"

#     workspaces {
#       name = "7l"
#     }
#   }
# }

# provider "google" {
#   region = var.gcp_region
# }

# provider "github" {
#   organization = "7Learnings"
# }

# data "google_organization" "_7L" {
#   domain = "7learnings.com"
# }
# Resources for Toolz application. Adding all the resources related to toolz to not to contaminate current infra.
# Also to have minimal resource(s) created with minimal scope assigned.

# Deviating from main.tf "google_project.project" resource as that has been used extensively every-where
# and creates a lot of resources which toolz app does not need.
resource "google_project" "toolz_project" {

  project_id      = "toolz-7l"
  name            = "DataSci Toolz"
  # billing_account = var.gcp_billing_account
  # org_id          = data.google_organization._7L.org_id
}


resource "google_service_account" "toolz_github_deployer" {

  project      = google_project.toolz_project.project_id
  account_id   = "github-actions-deployer"
  display_name = "Account for Deployment of Toolz Application from Github Actions"
}


# With minimal role(s).
resource "google_project_iam_member" "toolz_github_deployer" {
  for_each = toset([
    "roles/run.admin",
    "roles/iam.serviceAccountUser",
    "roles/storage.admin"
  ])

  project = google_project.toolz_project.project_id
  role    = each.key
  member  = "serviceAccount:${google_service_account.toolz_github_deployer.email}"
}
