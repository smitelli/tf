resource "linode_domain" "dotclockproductions-com" {
  domain    = "dotclockproductions.com"
  type      = "master"
  soa_email = local.default_soa_email
  tags      = ["dotclockproductions.com"]
}

resource "linode_domain_record" "a_dotclockproductions-com" {
  domain_id   = linode_domain.dotclockproductions-com.id
  record_type = "A"
  name        = ""
  target      = local.alala_ips.v4
}

resource "linode_domain_record" "aaaa_dotclockproductions-com" {
  domain_id   = linode_domain.dotclockproductions-com.id
  record_type = "AAAA"
  name        = ""
  target      = local.alala_ips.v6
}

resource "linode_domain_record" "cname_www-dotclockproductions-com" {
  domain_id   = linode_domain.dotclockproductions-com.id
  record_type = "CNAME"
  name        = "www"
  target      = linode_domain.dotclockproductions-com.domain
}

resource "linode_domain_record" "caa_dotclockproductions-com" {
  domain_id   = linode_domain.dotclockproductions-com.id
  record_type = "CAA"
  name        = ""
  tag         = "issue"
  target      = "letsencrypt.org"
}

resource "linode_domain_record" "txt_spf_dotclockproductions-com" {
  domain_id   = linode_domain.dotclockproductions-com.id
  record_type = "TXT"
  name        = ""
  target      = "v=spf1 -all"
}

resource "linode_domain_record" "txt_gsv_dotclockproductions-com" {
  domain_id   = linode_domain.dotclockproductions-com.id
  record_type = "TXT"
  name        = ""
  target      = "google-site-verification=Vo6OurSAL43C0TpHsXEieKMLiiDqlS05ZuTFiB354AQ"
}
