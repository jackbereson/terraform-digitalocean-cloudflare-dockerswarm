# Gọi module DigitalOcean
module "digitalocean" {
  source = "./modules/digitalocean"

  project_name            = var.project_name
  digitalocean_token      = var.digitalocean_token
  droplet_os              = var.droplet_os
  droplet_resolution      = var.droplet_resolution
  droplet_region          = var.droplet_region
  portainer_url           = var.portainer_url
  nginx_proxy_manager_url = var.nginx_proxy_manager_url
}

# Gọi module Cloudflare
module "cloudflare" {
  source = "./modules/cloudflare"

  cloudflare_token   = var.cloudflare_token
  cloudflare_zone_id = var.cloudflare_zone_id
  domain_name        = var.domain_name
  ipv4_address       = module.digitalocean.droplet_project.public_ip
}
