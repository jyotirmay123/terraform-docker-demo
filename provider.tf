# The following variable is used to configure the provider's authentication
# token. You don't need to provide a token on the command line to apply changes,
# though: using the remote backend, Terraform will execute remotely in Terraform
# Cloud where your token is already securely stored in your workspace!

variable "provider_token" {
  type = string
}

provider "fakewebservices" {
  token = var.provider_token
}

terraform {
  required_providers {
    # docker = {
    #   source = "kreuzwerker/docker"
    # }
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
    organization = "7L-tf"

    workspaces {
      name = "terraform-docker-demo"
    }
  }
}

# provider "docker" {}

# provider "google" {
#   region = var.gcp_region
# }

# provider "github" {
#   organization = "7Learnings"
# }

# data "google_organization" "_7L" {
#   domain = "7learnings.com"
# }
