resource "linode_domain" "rmucae8-com" {
  domain    = "609-1-800-rusty-mcintyres-used-car-automotive-emporium-8.com"
  type      = "master"
  soa_email = local.default_soa_email
  tags      = ["rmucae8.com"]
}

resource "linode_domain_record" "txt_spf_rmucae8-com" {
  domain_id   = linode_domain.rmucae8-com.id
  record_type = "TXT"
  name        = ""
  target      = "v=spf1 -all"
}
