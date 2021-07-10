resource "linode_domain" "internetstapler-com" {
  domain    = "internetstapler.com"
  type      = "master"
  soa_email = local.default_soa_email
  tags      = ["internetstapler.com"]
}

resource "linode_domain_record" "a_internetstapler-com" {
  domain_id   = linode_domain.internetstapler-com.id
  record_type = "A"
  name        = ""
  target      = local.alala_ips.v4
}

resource "linode_domain_record" "aaaa_internetstapler-com" {
  domain_id   = linode_domain.internetstapler-com.id
  record_type = "AAAA"
  name        = ""
  target      = local.alala_ips.v6
}

resource "linode_domain_record" "cname_www-internetstapler-com" {
  domain_id   = linode_domain.internetstapler-com.id
  record_type = "CNAME"
  name        = "www"
  target      = linode_domain.internetstapler-com.domain
}

resource "linode_domain_record" "caa_internetstapler-com" {
  domain_id   = linode_domain.internetstapler-com.id
  record_type = "CAA"
  name        = ""
  tag         = "issue"
  target      = "letsencrypt.org"
}

resource "linode_domain_record" "txt_spf_internetstapler-com" {
  domain_id   = linode_domain.internetstapler-com.id
  record_type = "TXT"
  name        = ""
  target      = "v=spf1 -all"
}

resource "linode_domain_record" "txt_gsv_internetstapler-com" {
  domain_id   = linode_domain.internetstapler-com.id
  record_type = "TXT"
  name        = ""
  target      = "google-site-verification=TkSqUeFpUlc16-aFqPzfVUS6qP2RWtb7yRDJNOqjrPY"
}
