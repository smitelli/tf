resource "linode_domain" "rmucae8-com" {
  domain    = "609-1-800-rusty-mcintyres-used-car-automotive-emporium-8.com"
  type      = "master"
  soa_email = local.default_soa_email
  tags      = ["rmucae8.com"]
}

module "base_rmucae8-com" {
  source = "./modules/base_domain"

  domain_id                = linode_domain.rmucae8-com.id
  domain_name              = linode_domain.rmucae8-com.domain
}

module "zohomail_rmucae8-com" {
  source = "./modules/zohomail"

  domain_id         = linode_domain.rmucae8-com.id
  #dkim_public_key   = ""
  verification_code = "zb10007808.zmverify.zoho.com"
}
