terraform {
  required_version = "~> 1.0.0"

  required_providers {
    linode = {
      source  = "linode/linode"
      version = "~> 1.19.0"
    }
  }
}

provider "linode" {
  # Prefer the `LINODE_TOKEN` environment variable whenever possible
  #token = ""
}
