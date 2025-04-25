variable "gcp_project_idproject_id" {
    description = "gcp project ID"
    type = string
}

variable "gcp_region"{
    description = "default region where resources will be created"
    type = string
}

variable "gke_cluster_name"{
    description = "name of GKE cluster"
    type = string
}

variable "machine_type" {
    description = "machine type for nodes of cluster"
    type = string
}

variable "node_count"{
    description = "number of nodes"
    type = number
}
