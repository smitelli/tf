resource "linode_domain" "kim559-com" {
  domain    = "kim559.com"
  type      = "master"
  soa_email = local.default_soa_email
  tags      = ["kim559.com"]
}

resource "linode_domain_record" "a_kim559-com" {
  domain_id   = linode_domain.kim559-com.id
  record_type = "A"
  name        = ""
  target      = local.alala_ips.v4
}

resource "linode_domain_record" "aaaa_kim559-com" {
  domain_id   = linode_domain.kim559-com.id
  record_type = "AAAA"
  name        = ""
  target      = local.alala_ips.v6
}

resource "linode_domain_record" "cname_www-kim559-com" {
  domain_id   = linode_domain.kim559-com.id
  record_type = "CNAME"
  name        = "www"
  target      = linode_domain.kim559-com.domain
}

resource "linode_domain_record" "caa_kim559-com" {
  domain_id   = linode_domain.kim559-com.id
  record_type = "CAA"
  name        = ""
  tag         = "issue"
  target      = "letsencrypt.org"
}

resource "linode_domain_record" "txt_spf_kim559-com" {
  domain_id   = linode_domain.kim559-com.id
  record_type = "TXT"
  name        = ""
  target      = "v=spf1 -all"
}
