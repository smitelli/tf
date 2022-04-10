resource "linode_domain" "thesweetnut-com" {
  domain    = "thesweetnut.com"
  type      = "master"
  soa_email = "scott+soa@thesweetnut.com"
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

  domain_id         = linode_domain.thesweetnut-com.id
  dkim_public_key   = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDZozHoxx9JTRrXgAhCqR4i28aW4ETnsUEU1lRFjc6aJ5L42emA6KDeLRqF7ajtYmx4DfG2yJB5m51mX4Bu79sfhwRrhX2EiUPpPNB+0X5YQBFpEOiG6Ziotk+SxmfYVnqRO7cyKalivy3qHpdZym5dU0wtRpGVvcLeKt1MHTQ85QIDAQAB"
  verification_code = "zb86899571.zmverify.zoho.com"
}
