output "main" {
  value = {
    public_ip     = module.digitalocean.droplet_project.public_ip
    portainer_url = module.digitalocean.droplet_project.portainer_url
    nginx_proxy_manager_url = module.digitalocean.droplet_project.nginx_proxy_manager_url
  }
}
