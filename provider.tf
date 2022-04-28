terraform {
  required_version = ">= 0.13"
  required_providers {
    harvester = {
      source  = "harvester/harvester"
      version = "~> 0.2.8"
    }
  }
}

provider "harvester" {
    kubeconfig = "./kubeconfig"
}