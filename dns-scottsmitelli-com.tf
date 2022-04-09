resource "linode_domain" "scottsmitelli-com" {
  domain    = "scottsmitelli.com"
  type      = "master"
  soa_email = "scott+soa@scottsmitelli.com"
  tags      = ["scottsmitelli.com"]
}

resource "linode_domain_record" "mx_1_scottsmitelli-com" {
  domain_id   = linode_domain.scottsmitelli-com.id
  record_type = "MX"
  name        = ""
  priority    = 1
  target      = "aspmx.l.google.com"
}

resource "linode_domain_record" "mx_2_scottsmitelli-com" {
  domain_id   = linode_domain.scottsmitelli-com.id
  record_type = "MX"
  name        = ""
  priority    = 5
  target      = "alt1.aspmx.l.google.com"
}

resource "linode_domain_record" "mx_3_scottsmitelli-com" {
  domain_id   = linode_domain.scottsmitelli-com.id
  record_type = "MX"
  name        = ""
  priority    = 5
  target      = "alt2.aspmx.l.google.com"
}

resource "linode_domain_record" "mx_4_scottsmitelli-com" {
  domain_id   = linode_domain.scottsmitelli-com.id
  record_type = "MX"
  name        = ""
  priority    = 10
  target      = "alt3.aspmx.l.google.com"
}

resource "linode_domain_record" "mx_5_scottsmitelli-com" {
  domain_id   = linode_domain.scottsmitelli-com.id
  record_type = "MX"
  name        = ""
  priority    = 10
  target      = "alt4.aspmx.l.google.com"
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

resource "linode_domain_record" "txt_spf_scottsmitelli-com" {
  domain_id   = linode_domain.scottsmitelli-com.id
  record_type = "TXT"
  name        = ""
  target      = "v=spf1 include:_spf.google.com a ~all"
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

resource "linode_domain_record" "txt_zv_scottsmitelli-com" {
  domain_id   = linode_domain.scottsmitelli-com.id
  record_type = "TXT"
  name        = ""
  target      = "zoho-verification=zb94673074.zmverify.zoho.com"
}
