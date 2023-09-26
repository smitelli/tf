resource "linode_domain" "k4llz-com" {
  domain    = "k4llz.com"
  type      = "master"
  soa_email = "scott+soa@k4llz.com"
  tags      = ["k4llz.com"]
}

module "base_k4llz-com" {
  source = "./modules/base_domain"

  domain_id   = linode_domain.k4llz-com.id
  domain_name = linode_domain.k4llz-com.domain
}

module "zohomail_k4llz-com" {
  source = "./modules/zohomail"

  domain_id         = linode_domain.k4llz-com.id
  # dkim_public_key   = ""
  # verification_code = ""
}
