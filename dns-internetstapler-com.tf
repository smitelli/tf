resource "linode_domain" "internetstapler-com" {
  domain    = "internetstapler.com"
  type      = "master"
  soa_email = "scott+soa@internetstapler.com"
  tags      = ["internetstapler.com"]
}

module "base_internetstapler-com" {
  source = "./modules/base_domain"

  domain_id                = linode_domain.internetstapler-com.id
  domain_name              = linode_domain.internetstapler-com.domain
  primary_ipv4             = [local.alala_ips.v4]
  primary_ipv6             = [local.alala_ips.v6]
  google_verification_code = "TkSqUeFpUlc16-aFqPzfVUS6qP2RWtb7yRDJNOqjrPY"
}

module "zohomail_internetstapler-com" {
  source = "./modules/zohomail"

  domain_id         = linode_domain.internetstapler-com.id
  dkim_public_key   = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCDqY8ucgcIaxb0gbd+XSqgL91O7yXLX/6KhnicYtxtAZFr6fm+kEUXX/ZgKwrcq+05IWzoCnswWnV0Z3l3saYVInaevlGYgk2VJluIf6Zs5offMBBwsM5RwT5Rd4I4xoGV7SglMp1bcJkafC50AH2LXXrb9gdi+Qkn/gNWhVSe5wIDAQAB"
  verification_code = "zb39657632.zmverify.zoho.com"
}
