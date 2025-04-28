# Terraform Settings Block

terraform {
  required_version = ">= 1.5.7"
  required_providers {
    google = {
      source = "hashicorp/google"
      version = ">= 5.34.0"
    }
    helm = {
      source = "hashicorp/helm"
      version = "3.0.0-pre2"
    }
    utils = {
      source  = "cloudposse/utils"
      version = ">= 1.0.0"
    }
  }
}

# Terraform Provider Block

provider "google" {
    project = var.gcp_project_id 
    region = var.gcp_region
}
