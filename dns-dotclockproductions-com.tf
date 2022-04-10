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
  dkim_public_key   = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCOv+f2+g/CXOBLXuA2qosfRgTu/90TCNGYNOQtZkafOmKLPFRC/ovLNPm7IAd30ESzdCkghu9VSWjBkt5JgvbyZ9gWC6H5l1ycPk4RFaItH+s3f3A3wseO2vFO8atgsMa0Tus9NJadBON9y08ATjdtw4B9X/9bZNAawQbkbFd3hQIDAQAB"
  verification_code = "zb17489101.zmverify.zoho.com"
}
