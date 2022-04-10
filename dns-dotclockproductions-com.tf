resource "linode_domain" "dotclockproductions-com" {
  domain    = "dotclockproductions.com"
  type      = "master"
  soa_email = "scott+soa@dotclockproductions.com"
  tags      = ["dotclockproductions.com"]
}

module "base_dotclockproductions-com" {
  source = "./modules/base_domain"

  domain_id                = linode_domain.dotclockproductions-com.id
  domain_name              = linode_domain.dotclockproductions-com.domain
  primary_ipv4             = [local.alala_ips.v4]
  primary_ipv6             = [local.alala_ips.v6]
  google_verification_code = "Vo6OurSAL43C0TpHsXEieKMLiiDqlS05ZuTFiB354AQ"
}

module "zohomail_dotclockproductions-com" {
  source = "./modules/zohomail"

  domain_id         = linode_domain.dotclockproductions-com.id
  #dkim_public_key   = ""
  verification_code = "zb17489101.zmverify.zoho.com"
}
