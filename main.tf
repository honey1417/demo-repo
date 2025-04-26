/*
resource "google_container_cluster" "primary" {
    name = var.gke_cluster_name 
    location = var.gcp_region
    deletion_protection = false
    remove_default_node_pool = true 
    initial_node_count = var.node_count
    node_config {
        machine_type = var.machine_type
        disk_size_gb = 70
    }   
}
*/

resource "google_container_cluster" "primary" {
  name               = var.gke_cluster_name
  location           = var.gcp_zone               
  deletion_protection = false
  remove_default_node_pool = true
  initial_node_count = var.node_count
  node_config {
    machine_type   = var.machine_type
    disk_size_gb   = 70
  }
}



