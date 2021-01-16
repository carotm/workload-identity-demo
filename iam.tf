## Gcloud SA
resource "google_service_account" "gcloud_sa" {
  account_id = local.gcloud_sa_name
}
## Binding Gcloud SA with K8s sa, using workload identity
resource "google_service_account_iam_member" "workload_identity_user" {
  service_account_id = google_service_account.gcloud_sa.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "serviceAccount:${data.google_project.project.project_id}.svc.id.goog[${kubernetes_namespace.demo_namespace.metadata.0.name}/${kubernetes_service_account.demo_sa.metadata.0.name}]"
}
