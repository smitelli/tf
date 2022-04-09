resource "linode_domain" "scottsmitelli-com" {
  domain    = "scottsmitelli.com"
  type      = "master"
  soa_email = "scott+soa@scottsmitelli.com"
  tags      = ["scottsmitelli.com"]
}

module "zohomail_scottsmitelli-com" {
  source            = "./modules/zohomail"
  domain_id         = linode_domain.scottsmitelli-com.id
  dkim_public_key   = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCYrIZRkcmANSjqczdsVwsAJjSj6ip4MbrO7kwaCy7v/f6hRzSKbInq3lGXl6xYmY7mN2Xfa9ZkWupjMVh6Dyg/xQT/wj5PQti0eW91XQ4nylclt2k4iSH0jSkjgCT6ZYUvWo25EbNmEVscs2wFWlG0FFbQLVAhIEcL8IE1qty69wIDAQAB"
  verification_code = "zb94673074.zmverify.zoho.com"
}

resource "linode_domain_record" "a_scottsmitelli-com" {
  domain_id   = linode_domain.scottsmitelli-com.id
  record_type = "A"
  name        = ""
  target      = local.alala_ips.v4
}

resource "linode_domain_record" "aaaa_scottsmitelli-com" {
  domain_id   = linode_domain.scottsmitelli-com.id
  record_type = "AAAA"
  name        = ""
  target      = local.alala_ips.v6
}

resource "linode_domain_record" "cname_gallery-scottsmitelli-com" {
  domain_id   = linode_domain.scottsmitelli-com.id
  record_type = "CNAME"
  name        = "gallery"
  target      = linode_domain.scottsmitelli-com.domain
}

resource "linode_domain_record" "cname_pics-scottsmitelli-com" {
  domain_id   = linode_domain.scottsmitelli-com.id
  record_type = "CNAME"
  name        = "pics"
  target      = linode_domain.scottsmitelli-com.domain
}

resource "linode_domain_record" "cname_www-scottsmitelli-com" {
  domain_id   = linode_domain.scottsmitelli-com.id
  record_type = "CNAME"
  name        = "www"
  target      = linode_domain.scottsmitelli-com.domain
}

resource "linode_domain_record" "caa_scottsmitelli-com" {
  domain_id   = linode_domain.scottsmitelli-com.id
  record_type = "CAA"
  name        = ""
  tag         = "issue"
  target      = "letsencrypt.org"
}

resource "linode_domain_record" "txt_gsv_scottsmitelli-com" {
  domain_id   = linode_domain.scottsmitelli-com.id
  record_type = "TXT"
  name        = ""
  target      = "google-site-verification=WLuppgrNX9b_eUNKStJ1I_9VauCuTgJGmLfCfMswChI"
}

resource "linode_domain_record" "txt_ksv_scottsmitelli-com" {
  domain_id   = linode_domain.scottsmitelli-com.id
  record_type = "TXT"
  name        = ""
  target      = "keybase-site-verification=vZzkuUFcKVMRBbJn8Q2w4qNJeYd5c9hqWi1YollNV44"
}
