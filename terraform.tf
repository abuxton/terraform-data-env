terraform {
  required_version = ">= 1.9"

  required_providers {
    environment = {
      source  = "EppO/environment"
      version = "~> 1.3"
    }
    external = {
      source  = "hashicorp/external"
      version = "~> 2.3"
    }
  }
}
