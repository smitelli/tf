terraform {
  required_version = "~> 1.0"

  required_providers {
    linode = {
      source  = "linode/linode"
      version = "~> 1.25"
    }
  }

  backend "remote" {
    organization = "smitelli-com"

    # Prefer the `terraform login` interactive flow whenever possible
    #token = ""

    workspaces {
      name = "tf"
    }
  }
}

provider "linode" {
  # Prefer the `LINODE_TOKEN` environment variable whenever possible
  #token = ""
}
