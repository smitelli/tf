resource "linode_domain" "northernflickermusic-com" {
  domain    = "northernflickermusic.com"
  type      = "master"
  soa_email = local.default_soa_email
  tags      = ["northernflickermusic.com"]
}

resource "linode_domain_record" "a_northernflickermusic-com" {
  domain_id   = linode_domain.northernflickermusic-com.id
  record_type = "A"
  name        = ""
  target      = local.alala_ips.v4
}

resource "linode_domain_record" "aaaa_northernflickermusic-com" {
  domain_id   = linode_domain.northernflickermusic-com.id
  record_type = "AAAA"
  name        = ""
  target      = local.alala_ips.v6
}

resource "linode_domain_record" "cname_www-northernflickermusic-com" {
  domain_id   = linode_domain.northernflickermusic-com.id
  record_type = "CNAME"
  name        = "www"
  target      = linode_domain.northernflickermusic-com.domain
}

resource "linode_domain_record" "caa_northernflickermusic-com" {
  domain_id   = linode_domain.northernflickermusic-com.id
  record_type = "CAA"
  name        = ""
  tag         = "issue"
  target      = "letsencrypt.org"
}

resource "linode_domain_record" "txt_spf_northernflickermusic-com" {
  domain_id   = linode_domain.northernflickermusic-com.id
  record_type = "TXT"
  name        = ""
  target      = "v=spf1 -all"
}
