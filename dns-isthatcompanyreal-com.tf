resource "linode_domain" "isthatcompanyreal-com" {
  domain    = "isthatcompanyreal.com"
  type      = "master"
  soa_email = local.default_soa_email
  tags      = ["isthatcompanyreal.com"]
}

resource "linode_domain_record" "a_isthatcompanyreal-com" {
  domain_id   = linode_domain.isthatcompanyreal-com.id
  record_type = "A"
  name        = ""
  target      = local.alala_ips.v4
}

resource "linode_domain_record" "aaaa_isthatcompanyreal-com" {
  domain_id   = linode_domain.isthatcompanyreal-com.id
  record_type = "AAAA"
  name        = ""
  target      = local.alala_ips.v6
}

resource "linode_domain_record" "cname_www-isthatcompanyreal-com" {
  domain_id   = linode_domain.isthatcompanyreal-com.id
  record_type = "CNAME"
  name        = "www"
  target      = linode_domain.isthatcompanyreal-com.domain
}

resource "linode_domain_record" "caa_isthatcompanyreal-com" {
  domain_id   = linode_domain.isthatcompanyreal-com.id
  record_type = "CAA"
  name        = ""
  tag         = "issue"
  target      = "letsencrypt.org"
}

resource "linode_domain_record" "txt_spf_isthatcompanyreal-com" {
  domain_id   = linode_domain.isthatcompanyreal-com.id
  record_type = "TXT"
  name        = ""
  target      = "v=spf1 -all"
}

resource "linode_domain_record" "txt_gsv_isthatcompanyreal-com" {
  domain_id   = linode_domain.isthatcompanyreal-com.id
  record_type = "TXT"
  name        = ""
  target      = "google-site-verification=eJs1-epD5uHpisYOSt91890geIewuMp1AwSY9K34IqI"
}
