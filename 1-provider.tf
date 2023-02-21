provider "google" {
  project = "batuhan-sarica-challange"
  region  = "europe-west1"
}
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}
