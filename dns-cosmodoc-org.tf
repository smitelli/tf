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
  dkim_public_key   = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCP0yzlRNHh0rpLrVrv+1OxkzbGqc8PXoB8sKSYrFoiUBpiXmkAASk8x3G3pJkewxx5zf1KDsmIzHFOydx4HvnGgvWqy80ieGDz+BfX+0TtQzEE4HwWmG9MUWCSDDrkX8qBUJqeSK0N3K5GdTgZaRZIyuV7/uWqJghTOZncxf4NQwIDAQAB"
  verification_code = "zb92885171.zmverify.zoho.com"
}
