resource "linode_domain" "zcot-net" {
  domain    = "zcot.net"
  type      = "master"
  soa_email = "soa@zcot.net"
  tags      = ["zcot.net"]
}

resource "linode_domain_record" "mx_zcot-net" {
  domain_id   = linode_domain.zcot-net.id
  record_type = "MX"
  name        = ""
  priority    = 1
  target      = "mx.zcot.net"
}

resource "linode_domain_record" "a_zcot-net" {
  domain_id   = linode_domain.zcot-net.id
  record_type = "A"
  name        = ""
  target      = local.alala_ips.v4
}

resource "linode_domain_record" "a_mx-zcot-net" {
  domain_id   = linode_domain.zcot-net.id
  record_type = "A"
  name        = "mx"
  target      = local.alala_ips.v4
}

resource "linode_domain_record" "aaaa_zcot-net" {
  domain_id   = linode_domain.zcot-net.id
  record_type = "AAAA"
  name        = ""
  target      = local.alala_ips.v6
}

# SMTP is not currently listening on any ipv6 interfaces; don't act like it is.
# resource "linode_domain_record" "aaaa_mx-zcot-net" {
#   domain_id   = linode_domain.zcot-net.id
#   record_type = "AAAA"
#   name        = "mx"
#   target      = local.alala_ips.v6
# }

resource "linode_domain_record" "cname_www-zcot-net" {
  domain_id   = linode_domain.zcot-net.id
  record_type = "CNAME"
  name        = "www"
  target      = linode_domain.zcot-net.domain
}

resource "linode_domain_record" "caa_zcot-net" {
  domain_id   = linode_domain.zcot-net.id
  record_type = "CAA"
  name        = ""
  tag         = "issue"
  target      = "letsencrypt.org"
}

resource "linode_domain_record" "txt_spf_zcot-net" {
  domain_id   = linode_domain.zcot-net.id
  record_type = "TXT"
  name        = ""
  target      = "v=spf1 -all"
}

resource "linode_domain_record" "txt_gsv_zcot-net" {
  domain_id   = linode_domain.zcot-net.id
  record_type = "TXT"
  name        = ""
  target      = "google-site-verification=TxkQkVV39ISGeVQtn6Bipk55obotjvBhjZWvJxPcCfs"
}
