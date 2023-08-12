resource "linode_domain" "laurenedman-com" {
  domain    = "laurenedman.com"
  type      = "master"
  soa_email = "info@laurenedman.com"
  tags      = ["laurenedman.com"]
}

module "base_laurenedman-com" {
  source = "./modules/base_domain"

  domain_id    = linode_domain.laurenedman-com.id
  domain_name  = linode_domain.laurenedman-com.domain
  primary_ipv4 = [local.alala_ips.v4]
  primary_ipv6 = [local.alala_ips.v6]
}

module "zohomail_laurenedman-com" {
  source = "./modules/zohomail"

  domain_id         = linode_domain.laurenedman-com.id
  dkim_public_key   = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDOvlxFvvEucUtrFFH6XAAxqrcrl8TDd8BBY7W0A24CaKMd4iFdna8LMuEKqoeNksOPRg8t82lwEPfTcp3xu7pWgikTMeNzgjfQ+i+yGNu34okjSzIRvllA0UvOgBm8q/hK8shmWN4yfq93i2cRqqAFt9Pxwn+ImFuS7lM9aIhwFQIDAQAB"
  verification_code = "zb36381187.zmverify.zoho.com"
}
