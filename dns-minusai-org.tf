resource "linode_domain" "minusai-org" {
  domain    = "minusai.org"
  type      = "master"
  soa_email = "scott+soa@minusai.org"
  tags      = ["minusai.org"]
}

module "base_minusai-org" {
  source = "./modules/base_domain"

  domain_id   = linode_domain.minusai-org.id
  domain_name = linode_domain.minusai-org.domain
}
