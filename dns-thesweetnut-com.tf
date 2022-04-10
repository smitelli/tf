resource "linode_domain" "thesweetnut-com" {
  domain    = "thesweetnut.com"
  type      = "master"
  soa_email = local.default_soa_email
  tags      = ["thesweetnut.com"]
}

module "base_thesweetnut-com" {
  source = "./modules/base_domain"

  domain_id                = linode_domain.thesweetnut-com.id
  domain_name              = linode_domain.thesweetnut-com.domain
  primary_ipv4             = [local.alala_ips.v4]
  primary_ipv6             = [local.alala_ips.v6]
  google_verification_code = "zWrFe7dubd8Nt06B74gCCxb1yr3LTlNAbP2uIVjemYg"
}

module "zohomail_thesweetnut-com" {
  source = "./modules/zohomail"

  domain_id         = linode_domain.triggerandfreewheel-com.id
  #dkim_public_key   = ""
  verification_code = "zb86899571.zmverify.zoho.com"
}
