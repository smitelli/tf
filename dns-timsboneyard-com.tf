resource "linode_domain" "timsboneyard-com" {
  domain    = "timsboneyard.com"
  type      = "master"
  soa_email = "scott+soa@timsboneyard.com"
  tags      = ["timsboneyard.com"]
}

module "base_timsboneyard-com" {
  source = "./modules/base_domain"

  domain_id                = linode_domain.timsboneyard-com.id
  domain_name              = linode_domain.timsboneyard-com.domain
  google_verification_code = "K2HqsxpiQNjAfRPT7SVoDiAiAIbQM8Fa0VluVG5NHDU"
}

module "zohomail_timsboneyard-com" {
  source = "./modules/zohomail"

  domain_id         = linode_domain.timsboneyard-com.id
  dkim_public_key   = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCRZUJ1fTKKG7iMGhJeVDV3q3qr3jqzI8aRRHkYq/mj+ImekrdgmhUtrXsagoRGqixtAhuFMXk7fLfucqvZQ4QIZ39AC7jZhW7nERL1w2Gtp9AsYxSpBz1aTiO0agvd9YbtR0oSZ2NXJUcECz/IEmjr8aV01RDelr3PbfUZsuck2wIDAQAB"
  verification_code = "zb08282058.zmverify.zoho.com"
}

resource "linode_domain_record" "a_timsboneyard-com" {
  domain_id   = linode_domain.timsboneyard-com.id
  record_type = "A"
  name        = ""
  target      = local.dummy_ip_v4 # Maintained by dyndns on calcabrina.acy1
  ttl_sec     = 5 * 60

  lifecycle {
    ignore_changes = [target]
  }
}

resource "linode_domain_record" "a_listen-timsboneyard-com" {
  domain_id   = linode_domain.timsboneyard-com.id
  record_type = "A"
  name        = "listen"
  target      = local.alala_ips.v4
}

resource "linode_domain_record" "aaaa_listen-timsboneyard-com" {
  domain_id   = linode_domain.timsboneyard-com.id
  record_type = "AAAA"
  name        = "listen"
  target      = local.alala_ips.v6
}
