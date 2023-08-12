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
  # dkim_public_key   = ""
  verification_code = "zb36381187.zmverify.zoho.com"
}
