resource "linode_domain" "northernflickermusic-com" {
  domain    = "northernflickermusic.com"
  type      = "master"
  soa_email = "info@laurenedman.com"
  tags      = ["northernflickermusic.com"]
}

module "base_northernflickermusic-com" {
  source = "./modules/base_domain"

  domain_id    = linode_domain.northernflickermusic-com.id
  domain_name  = linode_domain.northernflickermusic-com.domain
  primary_ipv4 = [local.alala_ips.v4]
  primary_ipv6 = [local.alala_ips.v6]
}

module "zohomail_northernflickermusic-com" {
  source = "./modules/zohomail"

  domain_id         = linode_domain.northernflickermusic-com.id
  dkim_public_key   = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCYNYET5BSDEpSkWuoMp2c1XmsYQGMKAf5WUtEb+/GKcZcLQRzojkutXJgQE8fopznYfXjgZ6uD4tpP+Zn07UjGyS+fBqHWhNnv3SyJjBJhlc+WXR78YR7X6c1hy98R0B7xST5pmGRV/+tUwfI1vBnejMhQZoHY+oftxcrqUikpdQIDAQAB"
  verification_code = "zb64559906.zmverify.zoho.com"
}
