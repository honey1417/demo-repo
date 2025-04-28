# Fetch GKE Cluster Details
data "google_client_config" "default" {}

data "google_container_cluster" "gke_cluster" {
  name     = var.gke_cluster_name
  location = var.gcp_zone # Change as per your cluster
  depends_on = [google_container_cluster.primary]
}

# Kubernetes Provider using GKE authentication
provider "kubernetes" {
  host                   = "https://${data.google_container_cluster.gke_cluster.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(data.google_container_cluster.gke_cluster.master_auth[0].cluster_ca_certificate)
}

# Helm Provider using GKE authentication
provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
    host                   = "https://${data.google_container_cluster.gke_cluster.endpoint}"
    token                  = data.google_client_config.default.access_token
    cluster_ca_certificate = base64decode(data.google_container_cluster.gke_cluster.master_auth[0].cluster_ca_certificate)
  }
}


module "delegate" {
  source = "harness/harness-delegate/kubernetes"
  version = "0.1.8"

  account_id = "TnI9iZ6IRnCmpxjiN2xMGg"
  delegate_token = "YzJjNmU3MmYxNjZmM2ViYjZhMmQ2MzBlNGJjNDhhOGM="
  delegate_name = "terraform-delegate"
  deploy_mode = "KUBERNETES"
  namespace = "harness-delegate-ng"
  manager_endpoint = "https://app.harness.io"
  delegate_image = "us-docker.pkg.dev/gar-prod-setup/harness-public/harness/delegate:25.04.85602"
  replicas = 1
  upgrader_enabled = true

  depends_on       = [google_container_cluster.primary]
}

  

