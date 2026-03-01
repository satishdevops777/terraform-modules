variable "bucket_name" {
  type = string
}

variable "kms_key_arn" {
  description = "KMS key ARN for encryption"
  type        = string
}

variable "versioning_enabled" {
  type    = bool
  default = true
}

variable "lifecycle_enabled" {
  type    = bool
  default = true
}

variable "transition_days" {
  description = "Days before moving to IA"
  type        = number
  default     = 30
}

variable "expiration_days" {
  description = "Days before object expiration"
  type        = number
  default     = 365
}

variable "force_destroy" {
  description = "Allow bucket deletion with objects"
  type        = bool
  default     = false
}

variable "tags" {
  type    = map(string)
  default = {}
}
