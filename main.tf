terraform {
  required_version = "~> v0.13.5"
}

provider "google" {
  project = "emerald-metrics-274919"
  region  = "us-east4"
  zone    = "us-east4-c"
}

## Local variables
locals {
  gke_name       = "demo-workload-identity"
  k8s_sa_name    = "gke-sa"
  k8s_namespace  = "demo"
  gcloud_sa_name = "gcloud-sa"
  gs_name        = "emerald-metrics-274919-a"
}

data "google_client_config" "current" {}

data "google_project" "project" {}
