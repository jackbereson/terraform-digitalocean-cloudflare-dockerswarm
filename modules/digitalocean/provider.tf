terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

# Khai báo provider
provider "digitalocean" {
  token = var.digitalocean_token
}