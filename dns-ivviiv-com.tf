resource "linode_domain" "ivviiv-com" {
  domain    = "ivviiv.com"
  type      = "master"
  soa_email = "scott+soa@ivviiv.com"
  tags      = ["ivviiv.com"]
}

module "base_ivviiv-com" {
  source = "./modules/base_domain"

  domain_id                = linode_domain.ivviiv-com.id
  domain_name              = linode_domain.ivviiv-com.domain
  primary_ipv4             = [local.alala_ips.v4]
  primary_ipv6             = [local.alala_ips.v6]
  google_verification_code = "idLyhN42pY9wR4vGGR9CDXoUIMY2CIq6lj92LyGWyRQ"
}

module "zohomail_ivviiv-com" {
  source = "./modules/zohomail"

  domain_id         = linode_domain.ivviiv-com.id
  #dkim_public_key   = ""
  verification_code = "zb97081596.zmverify.zoho.com"
}
