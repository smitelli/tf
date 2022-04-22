resource "linode_domain" "zcot-net" {
  domain    = "zcot.net"
  type      = "master"
  soa_email = "soa@zcot.net"
  tags      = ["zcot.net"]
}

module "base_zcot-net" {
  source = "./modules/base_domain"

  domain_id                = linode_domain.zcot-net.id
  domain_name              = linode_domain.zcot-net.domain
  primary_ipv4             = [local.alala_ips.v4]
  primary_ipv6             = [local.alala_ips.v6]
  google_verification_code = "TxkQkVV39ISGeVQtn6Bipk55obotjvBhjZWvJxPcCfs"
}

module "zohomail_zcot-net" {
  source = "./modules/zohomail"

  domain_id         = linode_domain.zcot-net.id
  dkim_public_key   = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCuEM6DU7mHlqBGFL2IjGlb4b9tTgiqGvRIrP/HkFvL7mU8io4Y0K49KBexJ7/0A6YJCnuJ3zJcZZWrj4V76TvByFDeGmWlEYvo5NQKjsD5lGCeC83HFn2f7ymfkRWe6zTThMsiGcMZwfab3ny0fKkJ3zZsLXEIXvvUmnhcshXtGQIDAQAB"
  verification_code = "zb86184027.zmverify.zoho.com"
}
