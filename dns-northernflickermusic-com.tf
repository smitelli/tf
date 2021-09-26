resource "linode_domain" "northernflickermusic-com" {
  domain    = "northernflickermusic.com"
  type      = "master"
  soa_email = local.default_soa_email
  tags      = ["northernflickermusic.com"]
}

resource "linode_domain_record" "txt_spf_northernflickermusic-com" {
  domain_id   = linode_domain.northernflickermusic-com.id
  record_type = "TXT"
  name        = ""
  target      = "v=spf1 -all"
}
