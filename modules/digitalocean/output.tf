output "droplet_project" {
  value = {
    public_ip     = digitalocean_droplet.project.ipv4_address
    portainer_url = "https://${digitalocean_droplet.project.ipv4_address}:9443"
    nginx_proxy_manager_url = "http://${digitalocean_droplet.project.ipv4_address}:81"
  }
}
