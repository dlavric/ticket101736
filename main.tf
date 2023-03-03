terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "daniela-org"
    workspaces {
      name = "gcp-ticket101736"
    }
  }

  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.55.0"
    }
  }
}

provider "google" {
  credentials = file("${path.module}/hc-3b46500bcce2402cadeeaabae40-35d91f7a98b2.json")
  project     = "daniela-test"
  region      = "us-central1"
}

resource "google_datastore_index" "default" {
  kind = "foodani"
  properties {
    name = "property_a"
    direction = "ASCENDING"
  }
  properties {
    name = "property_b"
    direction = "ASCENDING"
  }
}