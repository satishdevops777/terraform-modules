variable "zone_name" {
  description = "DNS zone name"
  type        = string
}

variable "private_zone" {
  description = "Create private hosted zone"
  type        = bool
  default     = false
}

variable "vpc_id" {
  description = "VPC ID for private hosted zone"
  type        = string
  default     = null
}

variable "records" {
  description = "List of DNS records"
  type = list(object({
    name    = string
    type    = string
    ttl     = optional(number)
    records = optional(list(string))
    alias = optional(object({
      name                   = string
      zone_id                = string
      evaluate_target_health = bool
    }))
  }))
  default = []
}

variable "tags" {
  type    = map(string)
  default = {}
}
