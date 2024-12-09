resource "linode_domain" "minus-ai-org" {
  domain    = "minus-ai.org"
  type      = "master"
  soa_email = "scott+soa@minus-ai.org"
  tags      = ["minus-ai.org"]
}

module "base_minus-ai-org" {
  source = "./modules/base_domain"

  domain_id   = linode_domain.minus-ai-org.id
  domain_name = linode_domain.minus-ai-org.domain
}
