variable "domain_id" {
  description = "The identifier of the Linode domain to attach the records to"
  type        = number
}

variable "domain_name" {
  description = "The name of the domain to which the records belong"
  type        = string
}

variable "primary_ipv4" {
  description = "A list of one or more IPv4 addresses for top-level A records"
  type        = list(string)
}

variable "primary_ipv6" {
  description = "A list of one or more IPv6 addresses for top-level AAAA records"
  type        = list(string)
}

variable "google_verification_code" {
  description = "The value to insert in the google-site-verification=... TXT record"
  type        = string
  default     = null
}
