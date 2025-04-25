# Terraform Settings Block

terraform {
  required_version = ">= 1.5.7"
  required_providers {
    google = {
      source = "hashicorp/google"
      version = ">= 5.34.0"
    }
  }
  backend "gcs" {
    bucket = "harshini-456810-bucket"
    prefix = "tfstate/"
  }
}

# Terraform Provider Block

provider "google" {
    project = var.gcp_project_id 
    region = var.gcp_region
}
