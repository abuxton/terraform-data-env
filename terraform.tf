terraform {
  required_version = ">= 1.5"

  required_providers {

    environment = {
      source  = "EppO/environment"
      version = "1.3.4"
    }
  }
  cloud {
    organization = "abc-vmp"

    workspaces {
      name = "test-data-env"
    }
  }
}

/* provider "environment" {
  # Configuration options
} */



