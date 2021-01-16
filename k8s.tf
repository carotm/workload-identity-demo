
provider "kubernetes" {
  load_config_file       = false
  host                   = "https://${google_container_cluster.primary.endpoint}"
  cluster_ca_certificate = base64decode(google_container_cluster.primary.master_auth.0.cluster_ca_certificate)
  token                  = data.google_client_config.current.access_token
}

## K8s Namespace
resource "kubernetes_namespace" "demo_namespace" {
  metadata {
    name = local.k8s_namespace
  }
}

## K8s SA - with annotattion to bind it with gcloud SA
resource "kubernetes_service_account" "demo_sa" {
  metadata {
    name      = local.k8s_sa_name
    namespace = kubernetes_namespace.demo_namespace.metadata.0.name
    annotations = {
      "iam.gke.io/gcp-service-account" = google_service_account.gcloud_sa.email
    }
  }
}
