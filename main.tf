# The following configuration uses a provider which provisions [fake] resources
# to a fictitious cloud vendor called "Fake Web Services". Configuration for
# the fakewebservices provider can be found in provider.tf.
#
# After running the setup script (./scripts/setup.sh), feel free to change these
# resources and 'terraform apply' as much as you'd like! These resources are
# purely for demonstration and created in Terraform Cloud, scoped to your TFC
# user account.
#
# To review the provider and documentation for the available resources and
# schemas, see: https://registry.terraform.io/providers/hashicorp/fakewebservices
#
# If you're looking for the configuration for the remote backend, you can find that
# in backend.tf.


resource "fakewebservices_vpc" "primary_vpc" {
  name       = "Primary VPC"
  cidr_block = "0.0.0.0/1"
}

resource "fakewebservices_server" "servers" {
  count = 2

  name = "Server ${count.index + 1}"
  type = "t2.micro"
  vpc  = fakewebservices_vpc.primary_vpc.name
}

resource "fakewebservices_load_balancer" "primary_lb" {
  name    = "Primary Load Balancer"
  servers = fakewebservices_server.servers[*].name
}

resource "fakewebservices_database" "prod_db" {
  name = "Production DB"
  size = 256
}

# resource "docker_image" "nginx" {
#   name         = "nginx:latest"
#   keep_locally = false
# }

# resource "docker_container" "nginx" {
#   image = docker_image.nginx.latest
#   name  = "tutorial"
#   ports {
#     internal = 80
#     external = 8000
#   }
# }

# Resources for Toolz application.
# resource "google_project_service" "project_service" {
#   project = "trial-01-7l"
#   service = "iap.googleapis.com"
# }
# resource "google_iap_brand" "project_brand" {
#   support_email     = "jyotirmay.senapati@7learnings.com"
#   application_title = "Toolz Application"
#   project           = google_project_service.project_service.project
# }
# resource "google_iap_client" "project_client" {
#   display_name = "Toolz"
#   brand        = google_iap_brand.project_brand.name
# }
# # data "github_actions_public_key" "example_public_key" {
# #   repository = "repo"
# # }
# resource "github_actions_secret" "toolz_client_secret" {
#   repository      = "repo"
#   secret_name     = "TOOLZ_CLIENT_SECRET"
#   plaintext_value = google_iap_client.project_client.CLIENT_SECRET
#   plaintext_value = google_iap_client.project_client.secret
# }


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

