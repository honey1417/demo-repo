resource "google_container_cluster" "primary" {
  name     = var.gke_cluster_name
  location     = var.gcp_zone  # Use `zone` instead of `location`
  deletion_protection = false
  remove_default_node_pool = true
  initial_node_count       = 1  # Still required even though it's removed later
  node_config {
    machine_type = var.machine_type
    disk_size_gb = 70
  }
}

resource "google_container_node_pool" "primary_nodes" {
  name     = "primary-node-pool"
  cluster  = google_container_cluster.primary.name
  location     = var.gcp_zone
  node_count = var.node_count
  node_config {
    machine_type = var.machine_type
    disk_size_gb = 70
  }

  depends_on = [google_container_cluster.primary]
}

/*

✅ When remove_default_node_pool = true in GKE:
No default node pool is created during cluster creation.

You must define a separate google_container_node_pool resource manually.

Set cluster argument in the node pool to reference the cluster.

Use depends_on in the node pool to ensure it waits for the cluster to be ready.

initial_node_count in the cluster resource is ignored.

*/