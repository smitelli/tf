resource "linode_domain" "onefinalsound-com" {
  domain    = "onefinalsound.com"
  type      = "master"
  soa_email = "scott+soa@onefinalsound.com"
  tags      = ["onefinalsound.com"]
}

module "base_onefinalsound-com" {
  source = "./modules/base_domain"

  domain_id   = linode_domain.onefinalsound-com.id
  domain_name = linode_domain.onefinalsound-com.domain
}

module "zohomail_onefinalsound-com" {
  source = "./modules/zohomail"

  domain_id         = linode_domain.onefinalsound-com.id
  #dkim_public_key   = ""
  verification_code = "zb02514618.zmverify.zoho.com"
}
