
terraform {
  cloud {

    organization = "abc-vmp"

    workspaces {
      name = "terraform-data-env"
    }
  }
}
