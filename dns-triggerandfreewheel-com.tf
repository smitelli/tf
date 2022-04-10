resource "linode_domain" "triggerandfreewheel-com" {
  domain    = "triggerandfreewheel.com"
  type      = "master"
  soa_email = "scott+soa@triggerandfreewheel.com"
  tags      = ["triggerandfreewheel.com"]
}

module "base_triggerandfreewheel-com" {
  source = "./modules/base_domain"

  domain_id                = linode_domain.triggerandfreewheel-com.id
  domain_name              = linode_domain.triggerandfreewheel-com.domain
  primary_ipv4             = [local.alala_ips.v4]
  primary_ipv6             = [local.alala_ips.v6]
  google_verification_code = "h32KHiVyB_ACkBS7A2OnlyWhoUX40iuJ6QycsHMCmUg"
}

module "zohomail_triggerandfreewheel-com" {
  source = "./modules/zohomail"

  domain_id         = linode_domain.triggerandfreewheel-com.id
  #dkim_public_key   = ""
  #verification_code = ""
}
