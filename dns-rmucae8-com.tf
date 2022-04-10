resource "linode_domain" "rmucae8-com" {
  domain    = "609-1-800-rusty-mcintyres-used-car-automotive-emporium-8.com"
  type      = "master"
  soa_email = "scott+soa@609-1-800-rusty-mcintyres-used-car-automotive-emporium-8.com"
  tags      = ["rmucae8.com"]
}

module "base_rmucae8-com" {
  source = "./modules/base_domain"

  domain_id   = linode_domain.rmucae8-com.id
  domain_name = linode_domain.rmucae8-com.domain
}

module "zohomail_rmucae8-com" {
  source = "./modules/zohomail"

  domain_id         = linode_domain.rmucae8-com.id
  dkim_public_key   = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDUktnQSwS1pDZf3N/pU/WDWk+Nw+JUtaHckcgcRddg/qd2Mi5EvpdgHuhX5rk5PpNxgNraKVYdn1D43OMJFe4igNrVTrPS4lqvTJKuVpadEPCIh5XF3OZ6vEkP7HX4sJAV7MUDr43FbjLY4EdnRz2oyuGy0luYz+cNECq283rfrQIDAQAB"
  verification_code = "zb10007808.zmverify.zoho.com"
}
