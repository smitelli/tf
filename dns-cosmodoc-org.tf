resource "linode_domain" "cosmodoc-org" {
  domain    = "cosmodoc.org"
  type      = "master"
  soa_email = local.default_soa_email
  tags      = ["cosmodoc.org"]
}

resource "linode_domain_record" "a_cosmodoc-org" {
  domain_id   = linode_domain.cosmodoc-org.id
  record_type = "A"
  name        = ""
  target      = local.alala_ips.v4
}

resource "linode_domain_record" "aaaa_cosmodoc-org" {
  domain_id   = linode_domain.cosmodoc-org.id
  record_type = "AAAA"
  name        = ""
  target      = local.alala_ips.v6
}

resource "linode_domain_record" "cname_www-cosmodoc-org" {
  domain_id   = linode_domain.cosmodoc-org.id
  record_type = "CNAME"
  name        = "www"
  target      = linode_domain.cosmodoc-org.domain
}

resource "linode_domain_record" "caa_cosmodoc-org" {
  domain_id   = linode_domain.cosmodoc-org.id
  record_type = "CAA"
  name        = ""
  tag         = "issue"
  target      = "letsencrypt.org"
}

resource "linode_domain_record" "txt_spf_cosmodoc-org" {
  domain_id   = linode_domain.cosmodoc-org.id
  record_type = "TXT"
  name        = ""
  target      = "v=spf1 -all"
}

resource "linode_domain_record" "txt_gsv_cosmodoc-org" {
  domain_id   = linode_domain.cosmodoc-org.id
  record_type = "TXT"
  name        = ""
  target      = "google-site-verification=XjFRDQBDgOIJlUhEYkv6IRLrORC0ij7sN_fK5B9TBg4"
}