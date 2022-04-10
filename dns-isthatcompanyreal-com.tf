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
  dkim_public_key   = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCucriYwsBkfd7+rAL7ToZPHFsfd19kb0nM1lVX0jC/3ZM70bvpGmz3XkfktL+w9PkVO0gFUwSBZRn57aNxNBe4FTfQiAGQkM9xCrWhhgGLnMGDzu1r9GuN0qO2MQVcDblZqX2r4lf5GA4SUwaLtlp5TdUzu/HdsrMv1QQnbs5M+wIDAQAB"
  verification_code = "zb32704310.zmverify.zoho.com"
}
