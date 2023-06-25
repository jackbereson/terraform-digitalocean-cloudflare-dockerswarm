# Tạo key pair SSH
resource "digitalocean_ssh_key" "project" {
  name       = var.project_name
  public_key = file("./ssh/key.pub")
}

# Tạo máy chủ
resource "digitalocean_droplet" "project" {
  name   = var.project_name
  image  = var.droplet_os
  region = var.droplet_region
  size   = var.droplet_resolution
  ssh_keys = [
    digitalocean_ssh_key.project.fingerprint
  ]

  connection {
    type        = "ssh"
    user        = "root"
    private_key = file("./ssh/key")
    timeout     = "8m"
    host        = self.ipv4_address
  }

  provisioner "remote-exec" {
    inline = [
      "apt-get update -qq",
      "apt-get install -y docker.io git-all",
      "curl -L ${var.nginx_proxy_manager_url} -o nginx-proxy.yml",
      "curl -L ${var.portainer_url} -o portainer-agent-stack.yml",
      "docker swarm init --advertise-addr ${self.ipv4_address}",
      "docker stack deploy -c portainer-agent-stack.yml portainer",
      "docker stack deploy -c ~/nginx-proxy.yml nginx-proxy",
    ]
  }
}


# resource "digitalocean_firewall" "project" {
#   name = "only-22-80-and-443"

#   droplet_ids = [digitalocean_droplet.project.id]

#   # inbound_rule {
#   #   protocol         = "tcp"
#   #   port_range       = "22"
#   #   source_addresses = ["192.168.1.0"]
#   # }

#   inbound_rule {
#     protocol         = "tcp"
#     port_range       = "80"
#     source_addresses = ["0.0.0.0/0", "::/0"]
#   }
#   inbound_rule {
#     protocol         = "tcp"
#     port_range       = "443"
#     source_addresses = ["0.0.0.0/0", "::/0"]
#   }

#   outbound_rule {
#     protocol              = "tcp"
#     port_range            = "All ports"
#     destination_addresses = ["0.0.0.0/0", "::/0"]
#   }

#   outbound_rule {
#     protocol              = "udp"
#     port_range            = "All ports"
#     destination_addresses = ["0.0.0.0/0", "::/0"]
#   }

#   outbound_rule {
#     protocol              = "icmp"
#     destination_addresses = ["0.0.0.0/0", "::/0"]
#   }
# }
