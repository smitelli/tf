resource "linode_domain" "smitelli-com" {
  domain    = "smitelli.com"
  type      = "master"
  soa_email = "scott+soa@smitelli.com"
  tags      = ["smitelli.com"]
}

module "base_smitelli-com" {
  source = "./modules/base_domain"

  domain_id                = linode_domain.smitelli-com.id
  domain_name              = linode_domain.smitelli-com.domain
  primary_ipv4             = [local.alala_ips.v4]
  primary_ipv6             = [local.alala_ips.v6]
  google_verification_code = "RZjE9cMMrIEZWmZ5UOWQSohaHPpT6_kQkNkeSkyZ3c0"
}

resource "linode_domain_record" "mx_1_smitelli-com" {
  domain_id   = linode_domain.smitelli-com.id
  record_type = "MX"
  name        = ""
  priority    = 1
  target      = "aspmx.l.google.com"
}

resource "linode_domain_record" "mx_2_smitelli-com" {
  domain_id   = linode_domain.smitelli-com.id
  record_type = "MX"
  name        = ""
  priority    = 5
  target      = "alt1.aspmx.l.google.com"
}

resource "linode_domain_record" "mx_3_smitelli-com" {
  domain_id   = linode_domain.smitelli-com.id
  record_type = "MX"
  name        = ""
  priority    = 5
  target      = "alt2.aspmx.l.google.com"
}

resource "linode_domain_record" "mx_4_smitelli-com" {
  domain_id   = linode_domain.smitelli-com.id
  record_type = "MX"
  name        = ""
  priority    = 10
  target      = "alt3.aspmx.l.google.com"
}

resource "linode_domain_record" "mx_5_smitelli-com" {
  domain_id   = linode_domain.smitelli-com.id
  record_type = "MX"
  name        = ""
  priority    = 10
  target      = "alt4.aspmx.l.google.com"
}

resource "linode_domain_record" "a_acy1-smitelli-com" {
  domain_id   = linode_domain.smitelli-com.id
  record_type = "A"
  name        = "acy1"
  target      = local.dummy_ip_v4 # Maintained by dyndns on calcabrina.acy1
  ttl_sec     = 5 * 60

  lifecycle {
    ignore_changes = [target]
  }
}

resource "linode_domain_record" "a_rdu1-smitelli-com" {
  domain_id   = linode_domain.smitelli-com.id
  record_type = "A"
  name        = "rdu1"
  target      = local.dummy_ip_v4 # Maintained by dyndns on malacoda.rdu1
  ttl_sec     = 5 * 60

  lifecycle {
    ignore_changes = [target]
  }
}

resource "linode_domain_record" "aaaa_acy1v6-smitelli-com" {
  domain_id   = linode_domain.smitelli-com.id
  record_type = "AAAA"
  name        = "acy1v6"
  target      = local.dummy_ip_v6 # Maintained by dyndns on calcabrina.acy1
  ttl_sec     = 5 * 60

  lifecycle {
    ignore_changes = [target]
  }
}

resource "linode_domain_record" "aaaa_rdu1v6-smitelli-com" {
  domain_id   = linode_domain.smitelli-com.id
  record_type = "AAAA"
  name        = "rdu1v6"
  target      = local.dummy_ip_v6 # Maintained by dyndns on malacoda.rdu1
  ttl_sec     = 5 * 60

  lifecycle {
    ignore_changes = [target]
  }
}

resource "linode_domain_record" "cname_calendar-smitelli-com" {
  domain_id   = linode_domain.smitelli-com.id
  record_type = "CNAME"
  name        = "calendar"
  target      = "ghs.googlehosted.com"
}

resource "linode_domain_record" "cname_comic-smitelli-com" {
  domain_id   = linode_domain.smitelli-com.id
  record_type = "CNAME"
  name        = "comic"
  target      = linode_domain.smitelli-com.domain
}

resource "linode_domain_record" "cname_drive-smitelli-com" {
  domain_id   = linode_domain.smitelli-com.id
  record_type = "CNAME"
  name        = "drive"
  target      = "ghs.googlehosted.com"
}

resource "linode_domain_record" "cname_mail-smitelli-com" {
  domain_id   = linode_domain.smitelli-com.id
  record_type = "CNAME"
  name        = "mail"
  target      = "ghs.googlehosted.com"
}

resource "linode_domain_record" "cname_moblog-smitelli-com" {
  domain_id   = linode_domain.smitelli-com.id
  record_type = "CNAME"
  name        = "moblog"
  target      = linode_domain.smitelli-com.domain
}

resource "linode_domain_record" "cname_scott-smitelli-com" {
  domain_id   = linode_domain.smitelli-com.id
  record_type = "CNAME"
  name        = "scott"
  target      = linode_domain.smitelli-com.domain
}

resource "linode_domain_record" "cname_sites-smitelli-com" {
  domain_id   = linode_domain.smitelli-com.id
  record_type = "CNAME"
  name        = "sites"
  target      = "ghs.googlehosted.com"
}

resource "linode_domain_record" "cname_webdav-smitelli-com" {
  domain_id   = linode_domain.smitelli-com.id
  record_type = "CNAME"
  name        = "webdav"
  target      = linode_domain.smitelli-com.domain
}

resource "linode_domain_record" "cname_webmail-smitelli-com" {
  domain_id   = linode_domain.smitelli-com.id
  record_type = "CNAME"
  name        = "webmail"
  target      = "ghs.googlehosted.com"
}

resource "linode_domain_record" "txt_spf_smitelli-com" {
  domain_id   = linode_domain.smitelli-com.id
  record_type = "TXT"
  name        = ""
  target      = "v=spf1 include:_spf.google.com a ~all"
}

resource "linode_domain_record" "txt_ksv_smitelli-com" {
  domain_id   = linode_domain.smitelli-com.id
  record_type = "TXT"
  name        = ""
  target      = "keybase-site-verification=VmB3HdCucrTy5p3wLW62elkAJAqAH7eVNaKQ32KUMSw"
}
