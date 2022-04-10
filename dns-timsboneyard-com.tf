resource "linode_domain" "timsboneyard-com" {
  domain    = "timsboneyard.com"
  type      = "master"
  soa_email = "scott+soa@timsboneyard.com"
  tags      = ["timsboneyard.com"]
}

module "zohomail_timsboneyard-com" {
  source = "./modules/zohomail"

  domain_id         = linode_domain.timsboneyard-com.id
  #dkim_public_key   = ""
  verification_code = "zb08282058.zmverify.zoho.com"
}

resource "linode_domain_record" "a_timsboneyard-com" {
  domain_id   = linode_domain.timsboneyard-com.id
  record_type = "A"
  name        = ""
  target      = local.dummy_ip_v4 # Maintained by dyndns service on acy1
  ttl_sec     = 300

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

resource "linode_domain_record" "cname_www-timsboneyard-com" {
  domain_id   = linode_domain.timsboneyard-com.id
  record_type = "CNAME"
  name        = "www"
  target      = linode_domain.timsboneyard-com.domain
}

resource "linode_domain_record" "caa_timsboneyard-com" {
  domain_id   = linode_domain.timsboneyard-com.id
  record_type = "CAA"
  name        = ""
  tag         = "issue"
  target      = "letsencrypt.org"
}

resource "linode_domain_record" "txt_gsv_timsboneyard-com" {
  domain_id   = linode_domain.timsboneyard-com.id
  record_type = "TXT"
  name        = ""
  target      = "google-site-verification=K2HqsxpiQNjAfRPT7SVoDiAiAIbQM8Fa0VluVG5NHDU"
}
