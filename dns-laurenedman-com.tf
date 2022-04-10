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

resource "linode_domain_record" "mx_1_laurenedman-com" {
  domain_id   = linode_domain.laurenedman-com.id
  record_type = "MX"
  name        = ""
  priority    = 1
  target      = "aspmx.l.google.com"
}

resource "linode_domain_record" "mx_2_laurenedman-com" {
  domain_id   = linode_domain.laurenedman-com.id
  record_type = "MX"
  name        = ""
  priority    = 5
  target      = "alt1.aspmx.l.google.com"
}

resource "linode_domain_record" "mx_3_laurenedman-com" {
  domain_id   = linode_domain.laurenedman-com.id
  record_type = "MX"
  name        = ""
  priority    = 5
  target      = "alt2.aspmx.l.google.com"
}

resource "linode_domain_record" "mx_4_laurenedman-com" {
  domain_id   = linode_domain.laurenedman-com.id
  record_type = "MX"
  name        = ""
  priority    = 10
  target      = "alt3.aspmx.l.google.com"
}

resource "linode_domain_record" "mx_5_laurenedman-com" {
  domain_id   = linode_domain.laurenedman-com.id
  record_type = "MX"
  name        = ""
  priority    = 10
  target      = "alt4.aspmx.l.google.com"
}

resource "linode_domain_record" "mx_6_laurenedman-com" {
  domain_id   = linode_domain.laurenedman-com.id
  record_type = "MX"
  name        = ""
  priority    = 15
  target      = "unmj5boqmpukqikgqwyts5vaqfgfotrvwesedeuv6rymllnevohq.mx-verification.google.com"
}

resource "linode_domain_record" "cname_webmail-laurenedman-com" {
  domain_id   = linode_domain.laurenedman-com.id
  record_type = "CNAME"
  name        = "webmail"
  target      = "ghs.googlehosted.com"
}

resource "linode_domain_record" "txt_spf_laurenedman-com" {
  domain_id   = linode_domain.laurenedman-com.id
  record_type = "TXT"
  name        = ""
  target      = "v=spf1 include:_spf.google.com ~all"
}
