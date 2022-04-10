resource "linode_domain" "cosmodoc-org" {
  domain    = "cosmodoc.org"
  type      = "master"
  soa_email = "scott+soa@cosmodoc.org"
  tags      = ["cosmodoc.org"]
}

module "base_cosmodoc-org" {
  source = "./modules/base_domain"

  domain_id                = linode_domain.cosmodoc-org.id
  domain_name              = linode_domain.cosmodoc-org.domain
  primary_ipv4             = [local.alala_ips.v4]
  primary_ipv6             = [local.alala_ips.v6]
  google_verification_code = "XjFRDQBDgOIJlUhEYkv6IRLrORC0ij7sN_fK5B9TBg4"
}

module "zohomail_cosmodoc-org" {
  source = "./modules/zohomail"

  domain_id         = linode_domain.cosmodoc-org.id
  #dkim_public_key   = ""
  verification_code = "zb92885171.zmverify.zoho.com"
}
