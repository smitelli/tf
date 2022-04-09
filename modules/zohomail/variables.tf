variable "domain_id" {
  description = "The identifier of the Linode domain to attach the records to"
  type        = number
}

variable "dkim_public_key" {
  description = "The public key material for the DKIM p=... element"
  type        = string
  default     = null
}

variable "verification_code" {
  description = "The value to insert in the zoho-verification=... TXT record"
  type        = string
  default     = null
}
