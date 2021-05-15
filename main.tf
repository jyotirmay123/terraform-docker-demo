terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.50"
    }
    github = {
      source  = "hashicorp/github"
      version = "~> 4.1"
    }
  }

  backend "remote" {
    organization = "7L"

    workspaces {
      name = "gcp"
    }
  }
}

provider "google" {
  region = "europe-west3"
}

provider "github" {
  organization = "7Learnings"
}

data "google_organization" "_7L" {
  domain = "7learnings.com"
}

# Resources for Toolz application.
resource "google_project_service" "project_service" {
  project = "trial-01-7l"
  service = "iap.googleapis.com"
}

resource "google_iap_brand" "project_brand" {
  support_email     = "jyotirmay.senapati@7learnings.com"
  application_title = "Toolz Application"
  project           = google_project_service.project_service.project
}

resource "google_iap_client" "project_client" {
  display_name = "Toolz"
  brand        = google_iap_brand.project_brand.name
}

# data "github_actions_public_key" "example_public_key" {
#   repository = "repo"
# }

resource "github_actions_secret" "toolz_client_secret" {
  repository      = "repo"
  secret_name     = "TOOLZ_CLIENT_SECRET"
  plaintext_value = google_iap_client.project_client.secret
}


resource "random_string" "toolz" {
  length           = 50
  upper            = false
  lower            = true
  number           = true
  special          = true
  override_special = "!@#$%^&*(-_=+)"
}


resource "github_actions_secret" "toolz_secret_key" {
  repository      = "repo"
  secret_name     = "TOOLZ_SECRET_KEY"
  plaintext_value = random_string.toolz.result
}


