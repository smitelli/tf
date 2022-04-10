resource "linode_domain" "isthatcompanyreal-com" {
  domain    = "isthatcompanyreal.com"
  type      = "master"
  soa_email = "scott+soa@isthatcompanyreal.com"
  tags      = ["isthatcompanyreal.com"]
}

module "base_isthatcompanyreal-com" {
  source = "./modules/base_domain"

  domain_id                = linode_domain.isthatcompanyreal-com.id
  domain_name              = linode_domain.isthatcompanyreal-com.domain
  primary_ipv4             = [local.alala_ips.v4]
  primary_ipv6             = [local.alala_ips.v6]
  google_verification_code = "eJs1-epD5uHpisYOSt91890geIewuMp1AwSY9K34IqI"
}

module "zohomail_isthatcompanyreal-com" {
  source = "./modules/zohomail"

  domain_id         = linode_domain.isthatcompanyreal-com.id
  #dkim_public_key   = ""
  verification_code = "zb32704310.zmverify.zoho.com"
}
