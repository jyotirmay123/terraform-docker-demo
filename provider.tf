# The following variable is used to configure the provider's authentication
# token. You don't need to provide a token on the command line to apply changes,
# though: using the remote backend, Terraform will execute remotely in Terraform
# Cloud where your token is already securely stored in your workspace!

# variable "provider_token" {
#   type = string
# }

# provider "fakewebservices" {
#   token = var.provider_token
# }
terraform {
  required_providers {
    # docker = {
    #   source = "kreuzwerker/docker"
    # }
    # google = {
    #   source  = "hashicorp/google"
    #   version = "~> 3.50"
    # }
    github = {
      source  = "integrations/github"
      version = "~> 4.1"
    }
  }
}

# provider "docker" {}

# provider "google" {}

provider "github" {
  token = "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"
  owner = "jyotirmay123"
}

# data "google_organization" "_7L" {
#   domain = "7learnings.com"
# }
