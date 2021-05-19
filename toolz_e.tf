# locals {
#   projects = [
#     {
#       project          = "trial-01"
#       tfe_workspace    = "trial-01-prod"
#       gcp_project      = "trial-01-7l"
#       gcp_project_name = "Trial Project"
#     },
#     {
#       project          = "public-data"
#       gcp_project      = "public-data-7l"
#       gcp_project_name = "Public data"
#     },
#   ]
#   environments = ["dev", "production"]
#   demo_project = {
#     project     = "l-front-end"
#     gcp_project = "l-front-end"
#   }
#   toolz_project = {

#     project          = "toolz-7l"
#     gcp_project      = "toolz-7l"
#     gcp_project_name = "Toolz Project"
#   }
# }

# resource "google_project" "projects" {
#   for_each = { for p in concat(local.projects, [local.toolz_project]) : p.gcp_project => p }

#   project_id      = each.key
#   name            = each.value.gcp_project_name
# #   billing_account = var.gcp_billing_account
# #   org_id          = data.google_organization._7L.org_id
# }