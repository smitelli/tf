resource "linode_domain" "triggerandfreewheel-com" {
  domain    = "triggerandfreewheel.com"
  type      = "master"
  soa_email = "scott+soa@triggerandfreewheel.com"
  tags      = ["triggerandfreewheel.com"]
}

resource "linode_domain_record" "mx_1_triggerandfreewheel-com" {
  domain_id   = linode_domain.triggerandfreewheel-com.id
  record_type = "MX"
  name        = ""
  priority    = 1
  target      = "aspmx.l.google.com"
}

resource "linode_domain_record" "mx_2_triggerandfreewheel-com" {
  domain_id   = linode_domain.triggerandfreewheel-com.id
  record_type = "MX"
  name        = ""
  priority    = 5
  target      = "alt1.aspmx.l.google.com"
}

resource "linode_domain_record" "mx_3_triggerandfreewheel-com" {
  domain_id   = linode_domain.triggerandfreewheel-com.id
  record_type = "MX"
  name        = ""
  priority    = 5
  target      = "alt2.aspmx.l.google.com"
}

resource "linode_domain_record" "mx_4_triggerandfreewheel-com" {
  domain_id   = linode_domain.triggerandfreewheel-com.id
  record_type = "MX"
  name        = ""
  priority    = 10
  target      = "alt3.aspmx.l.google.com"
}

resource "linode_domain_record" "mx_5_triggerandfreewheel-com" {
  domain_id   = linode_domain.triggerandfreewheel-com.id
  record_type = "MX"
  name        = ""
  priority    = 10
  target      = "alt4.aspmx.l.google.com"
}

resource "linode_domain_record" "a_triggerandfreewheel-com" {
  domain_id   = linode_domain.triggerandfreewheel-com.id
  record_type = "A"
  name        = ""
  target      = local.alala_ips.v4
}

resource "linode_domain_record" "aaaa_triggerandfreewheel-com" {
  domain_id   = linode_domain.triggerandfreewheel-com.id
  record_type = "AAAA"
  name        = ""
  target      = local.alala_ips.v6
}

resource "linode_domain_record" "cname_www-triggerandfreewheel-com" {
  domain_id   = linode_domain.triggerandfreewheel-com.id
  record_type = "CNAME"
  name        = "www"
  target      = linode_domain.triggerandfreewheel-com.domain
}

resource "linode_domain_record" "caa_triggerandfreewheel-com" {
  domain_id   = linode_domain.triggerandfreewheel-com.id
  record_type = "CAA"
  name        = ""
  tag         = "issue"
  target      = "letsencrypt.org"
}

resource "linode_domain_record" "txt_spf_triggerandfreewheel-com" {
  domain_id   = linode_domain.triggerandfreewheel-com.id
  record_type = "TXT"
  name        = ""
  target      = "v=spf1 include:_spf.google.com a ~all"
}

resource "linode_domain_record" "txt_gsv_triggerandfreewheel-com" {
  domain_id   = linode_domain.triggerandfreewheel-com.id
  record_type = "TXT"
  name        = ""
  target      = "google-site-verification=h32KHiVyB_ACkBS7A2OnlyWhoUX40iuJ6QycsHMCmUg"
}
