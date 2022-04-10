resource "linode_domain" "triggerandfreewheel-com" {
  domain    = "triggerandfreewheel.com"
  type      = "master"
  soa_email = "scott+soa@triggerandfreewheel.com"
  tags      = ["triggerandfreewheel.com"]
}

module "base_triggerandfreewheel-com" {
  source = "./modules/base_domain"

  domain_id                = linode_domain.triggerandfreewheel-com.id
  domain_name              = linode_domain.triggerandfreewheel-com.domain
  primary_ipv4             = [local.alala_ips.v4]
  primary_ipv6             = [local.alala_ips.v6]
  google_verification_code = "h32KHiVyB_ACkBS7A2OnlyWhoUX40iuJ6QycsHMCmUg"
}

module "zohomail_triggerandfreewheel-com" {
  source = "./modules/zohomail"

  domain_id         = linode_domain.triggerandfreewheel-com.id
  dkim_public_key   = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDGXbtkPJ788i2jVFhK6mecEK4TdzWDBDSVGgf6KqGQE54h1BBHlsUyOknj3WJXwvZ6tCI4OeKKeB2Ibvl7M5PMog6fvrQe7qcvTd10FBYJb+OqMuPGTcQ8q6rLcbZFHlrXes5qFEo3ZM1cUWam2mN8pf7OYDqBYk1vAj9YDQ96aQIDAQAB"
  verification_code = "zb10281278.zmverify.zoho.com"
}
