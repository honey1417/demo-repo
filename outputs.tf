#Output: K8s Cluster IP
output "kubeconfig" {
    value = google_container_cluster.primary.endpoint
}