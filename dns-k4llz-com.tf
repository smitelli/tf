resource "linode_domain" "k4llz-com" {
  domain    = "k4llz.com"
  type      = "master"
  soa_email = "scott+soa@k4llz.com"
  tags      = ["k4llz.com"]
}

module "base_k4llz-com" {
  source = "./modules/base_domain"

  domain_id   = linode_domain.k4llz-com.id
  domain_name = linode_domain.k4llz-com.domain
}

module "zohomail_k4llz-com" {
  source = "./modules/zohomail"

  domain_id         = linode_domain.k4llz-com.id
  dkim_public_key   = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCAlv2PB2GISdb5eiF3BlWbZOjFRRqJbwR74IRVDtBeDZrz6TqTnS0nqdyMTJ0xIoZHhOhixwxzp54+EEx65ksUyISmHICnR+lppRfYmEcHx5F7wd08FbyIOZGlr7USr76eQFawaYjP/btj5QtPRlQqeoX00RpGNoKbqlOaogXqUQIDAQAB"
  verification_code = "zb35546922.zmverify.zoho.com"
}
