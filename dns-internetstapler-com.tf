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
  #dkim_public_key   = ""
  verification_code = "zb39657632.zmverify.zoho.com"
}
