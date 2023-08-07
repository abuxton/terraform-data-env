terraform {
  required_version = ">= 1.5"

  required_providers {
    commandpersistence = {
      source  = "terrycain/commandpersistence"
      version = "1.1.0"
    }
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

provider "environment" {
  # Configuration options
}

provider "commandpersistence" {
  # Configuration options
}

