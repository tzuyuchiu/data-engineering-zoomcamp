terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.16.0"
    }
  }
}

provider "google" {
  project = "festive-music-448221-u0"
  region  = "europe-west1-b"
}

resource "google_storage_bucket" "demo-bucket" {
  name     = "festive-music-448221-u0-terraform-bucket"
  location = "EUROPE-WEST1"

  # Optional, but recommended settings:
  storage_class               = "STANDARD"
  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 30 // days
    }
  }

  force_destroy = true
}

resource "google_bigquery_dataset" "demo-dataset" {
  dataset_id = "demo_dataset"

}