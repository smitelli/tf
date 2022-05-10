terraform {
  required_providers {
    linode = {
      source = "linode/linode"
    }
  }
}

resource "linode_domain_record" "mx_1" {
  domain_id   = var.domain_id
  record_type = "MX"
  name        = ""
  priority    = 10
  target      = "mx.zoho.com"
}

resource "linode_domain_record" "mx_2" {
  domain_id   = var.domain_id
  record_type = "MX"
  name        = ""
  priority    = 20
  target      = "mx2.zoho.com"
}

resource "linode_domain_record" "mx_3" {
  domain_id   = var.domain_id
  record_type = "MX"
  name        = ""
  priority    = 50
  target      = "mx3.zoho.com"
}

resource "linode_domain_record" "txt_spf" {
  domain_id   = var.domain_id
  record_type = "TXT"
  name        = ""
  target      = "v=spf1 include:zoho.com a ~all"
}

resource "linode_domain_record" "txt_dkim" {
  count = (var.dkim_public_key == null) ? 0 : 1

  domain_id   = var.domain_id
  record_type = "TXT"
  name        = "zmail._domainkey"
  target      = "v=DKIM1; k=rsa; p=${var.dkim_public_key}"
}

resource "linode_domain_record" "txt_verification" {
  count = (var.verification_code == null) ? 0 : 1

  domain_id   = var.domain_id
  record_type = "TXT"
  name        = ""
  target      = "zoho-verification=${var.verification_code}"
}
