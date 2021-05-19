
# ## for Github Actions deployer
# resource "google_service_account" "github_deployer" {
#   for_each = google_project.projects

#   project      = each.key
#   account_id   = "github-actions-deployer"
#   display_name = "Account for Deployment of Optimizer from Github Actions"
# }

# ## GitHub Actions Deployer
# resource "google_project_iam_member" "github_deployer" {
#   for_each = {
#     for e in setproduct([for p in google_service_account.github_deployer : p], [
#       "roles/appengine.appAdmin",
#       "roles/cloudbuild.builds.builder",
#       "roles/cloudscheduler.admin",
#       "roles/iam.serviceAccountUser",
#       "roles/run.admin",
#       "roles/storage.admin",
#       # For e2e test
#       "roles/bigquery.user",
#       "roles/bigquery.dataEditor",
#     ]) :
#     "${e[0].project}-${e[1]}" => {
#       account = e[0]
#       role    = e[1]
#     }
#   }

#   project = each.value.account.project
#   role    = each.value.role
#   member  = "serviceAccount:${each.value.account.email}"
# }