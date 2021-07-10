resource "linode_domain" "ivviiv-com" {
  domain    = "ivviiv.com"
  type      = "master"
  soa_email = local.default_soa_email
  tags      = ["ivviiv.com"]
}

resource "linode_domain_record" "a_ivviiv-com" {
  domain_id   = linode_domain.ivviiv-com.id
  record_type = "A"
  name        = ""
  target      = local.alala_ips.v4
}

resource "linode_domain_record" "aaaa_ivviiv-com" {
  domain_id   = linode_domain.ivviiv-com.id
  record_type = "AAAA"
  name        = ""
  target      = local.alala_ips.v6
}

resource "linode_domain_record" "cname_www-ivviiv-com" {
  domain_id   = linode_domain.ivviiv-com.id
  record_type = "CNAME"
  name        = "www"
  target      = linode_domain.ivviiv-com.domain
}

resource "linode_domain_record" "caa_ivviiv-com" {
  domain_id   = linode_domain.ivviiv-com.id
  record_type = "CAA"
  name        = ""
  tag         = "issue"
  target      = "letsencrypt.org"
}

resource "linode_domain_record" "txt_spf_ivviiv-com" {
  domain_id   = linode_domain.ivviiv-com.id
  record_type = "TXT"
  name        = ""
  target      = "v=spf1 -all"
}

resource "linode_domain_record" "txt_gsv_ivviiv-com" {
  domain_id   = linode_domain.ivviiv-com.id
  record_type = "TXT"
  name        = ""
  target      = "google-site-verification=idLyhN42pY9wR4vGGR9CDXoUIMY2CIq6lj92LyGWyRQ"
}
