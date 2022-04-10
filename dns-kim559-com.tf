resource "linode_domain" "kim559-com" {
  domain    = "kim559.com"
  type      = "master"
  soa_email = "scott+soa@kim559.com"
  tags      = ["kim559.com"]
}

module "base_kim559-com" {
  source = "./modules/base_domain"

  domain_id    = linode_domain.kim559-com.id
  domain_name  = linode_domain.kim559-com.domain
  primary_ipv4 = [local.alala_ips.v4]
  primary_ipv6 = [local.alala_ips.v6]
}

module "zohomail_kim559-com" {
  source = "./modules/zohomail"

  domain_id         = linode_domain.kim559-com.id
  #dkim_public_key   = ""
  verification_code = "zb78802349.zmverify.zoho.com"
}
