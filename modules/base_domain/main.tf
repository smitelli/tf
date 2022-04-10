terraform {
  required_providers {
    linode = {
      source = "linode/linode"
    }
  }
}

#
# Base A and/or AAAA records for the domain apex
#
resource "linode_domain_record" "a" {
  for_each = toset(var.primary_ipv4)

  domain_id   = var.domain_id
  record_type = "A"
  name        = ""
  target      = each.key
}

resource "linode_domain_record" "aaaa" {
  for_each = toset(var.primary_ipv6)

  domain_id   = var.domain_id
  record_type = "AAAA"
  name        = ""
  target      = each.key
}

#
# www -> apex
#
resource "linode_domain_record" "www" {
  domain_id   = var.domain_id
  record_type = "CNAME"
  name        = "www"
  target      = var.domain_name
}

#
# CAA record -- Only Let's Encrypt is currently used
#
resource "linode_domain_record" "caa" {
  domain_id   = var.domain_id
  record_type = "CAA"
  name        = ""
  tag         = "issue"
  target      = "letsencrypt.org"
}

#
# Google site ownership verification
#
resource "linode_domain_record" "txt_google_verification" {
  count = (var.google_verification_code == null) ? 0 : 1

  domain_id   = var.domain_id
  record_type = "TXT"
  name        = ""
  target      = "google-site-verification=${var.google_verification_code}"
}
