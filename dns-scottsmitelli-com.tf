resource "linode_domain" "scottsmitelli-com" {
  domain    = "scottsmitelli.com"
  type      = "master"
  soa_email = "scott+soa@scottsmitelli.com"
  tags      = ["scottsmitelli.com"]
}

module "base_scottsmitelli-com" {
  source = "./modules/base_domain"

  domain_id                = linode_domain.scottsmitelli-com.id
  domain_name              = linode_domain.scottsmitelli-com.domain
  primary_ipv4             = [local.alala_ips.v4]
  primary_ipv6             = [local.alala_ips.v6]
  google_verification_code = "WLuppgrNX9b_eUNKStJ1I_9VauCuTgJGmLfCfMswChI"

module "zohomail_scottsmitelli-com" {
  source = "./modules/zohomail"

  domain_id         = linode_domain.scottsmitelli-com.id
  dkim_public_key   = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCYrIZRkcmANSjqczdsVwsAJjSj6ip4MbrO7kwaCy7v/f6hRzSKbInq3lGXl6xYmY7mN2Xfa9ZkWupjMVh6Dyg/xQT/wj5PQti0eW91XQ4nylclt2k4iSH0jSkjgCT6ZYUvWo25EbNmEVscs2wFWlG0FFbQLVAhIEcL8IE1qty69wIDAQAB"
  verification_code = "zb94673074.zmverify.zoho.com"
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

resource "linode_domain_record" "txt_ksv_scottsmitelli-com" {
  domain_id   = linode_domain.scottsmitelli-com.id
  record_type = "TXT"
  name        = ""
  target      = "keybase-site-verification=vZzkuUFcKVMRBbJn8Q2w4qNJeYd5c9hqWi1YollNV44"
}
