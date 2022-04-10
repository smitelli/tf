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
  dkim_public_key   = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCQ3NjUUtKo9XJ+tiUpW6KrSMK1qHSglgf6AKM+rGVBkJDAWsmGQnZujhbIw1XjEbQxuOHwcS3qfR16/aULsFK52fp7bkLQUZwwbQMLJzi8Yckm91k0zLn+d43ABhoNbmjOxBkLG4R9S/6IPdwLPv3fUpl3B69qACkcWx/U02X91wIDAQAB"
  verification_code = "zb78802349.zmverify.zoho.com"
}
