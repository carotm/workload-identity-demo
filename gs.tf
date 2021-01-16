
# Google Storage Bucket
resource "google_storage_bucket" "demo_bucket" {
  name = local.gs_name
}

# Bucket object
resource "google_storage_bucket_object" "picture" {
  name   = "devops.gif"
  source = "devops.gif"
  bucket = google_storage_bucket.demo_bucket.name
}

## Storage access 
resource "google_storage_bucket_iam_member" "member" {
  bucket = google_storage_bucket.demo_bucket.name
  role   = "roles/storage.admin"
  member = "serviceAccount:${google_service_account.gcloud_sa.email}"
}
