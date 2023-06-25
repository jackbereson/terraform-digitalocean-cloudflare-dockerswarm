variable "digitalocean_token" {
  type        = string
  description = "Digitalocean Access Token"
}

variable "project_name" {
  type = string
}

variable "portainer_url" {
  type = string
}

variable "nginx_proxy_manager_url" {
  type = string
}

variable "droplet_os" {
  type        = string
  description = "Droplet linux os"

  validation {
    condition     = contains(["ubuntu-18-04-x64", "ubuntu-21-04-x64", "ubuntu-22-04-x64"], var.droplet_os)
    error_message = "Value not allow."
  }
}

variable "droplet_resolution" {
  type        = string
  description = "Droplet resolution"

  validation {
    condition     = contains(["s-1vcpu-1gb", "s-2vcpu-4gb", "s-4vcpu-8gb"], var.droplet_resolution)
    error_message = "Value not allow."
  }
}

variable "droplet_region" {
  type        = string
  description = "Droplet region"

  validation {
    condition     = contains(["nyc3", "sgp1"], var.droplet_region)
    error_message = "Value not allow."
  }
}