
resource "cloudflare_record" "www" {
  zone_id = var.cloudflare_zone_id
  name    = "www"
  value   = var.domain_name
  type    = "CNAME"
  proxied = true
}

resource "cloudflare_record" "website" {
  zone_id = var.cloudflare_zone_id
  name    = var.domain_name
  value   = var.ipv4_address
  type    = "A"
  proxied = true
}

resource "cloudflare_record" "console" {
  zone_id = var.cloudflare_zone_id
  name    = "console"
  value   = var.ipv4_address
  type    = "A"
  proxied = true
}

resource "cloudflare_record" "proxy" {
  zone_id = var.cloudflare_zone_id
  name    = "proxy"
  value   = var.ipv4_address
  type    = "A"
  proxied = true
}

resource "cloudflare_record" "dashboard" {
  zone_id = var.cloudflare_zone_id
  name    = "dashboard"
  value   = var.ipv4_address
  type    = "A"
  proxied = true
}


resource "cloudflare_record" "pool" {
  zone_id = var.cloudflare_zone_id
  name    = "pool"
  value   = var.ipv4_address
  type    = "A"
  proxied = true
}


resource "cloudflare_record" "testnet" {
  zone_id = var.cloudflare_zone_id
  name    = "testnet"
  value   = var.ipv4_address
  type    = "A"
  proxied = true
}


resource "cloudflare_record" "testnet-core" {
  zone_id = var.cloudflare_zone_id
  name    = "testnet-core"
  value   = var.ipv4_address
  type    = "A"
  proxied = true
}

resource "cloudflare_record" "app" {
  zone_id = var.cloudflare_zone_id
  name    = "app"
  value   = var.ipv4_address
  type    = "A"
  proxied = true
}
