variable "name" {
  description = "Secret name"
  type        = string
}

variable "description" {
  description = "Secret description"
  type        = string
  default     = ""
}

variable "secret_string" {
  description = "Secret value (JSON or plain text)"
  type        = string
  sensitive   = true
}

variable "kms_key_id" {
  description = "Custom KMS key for encryption"
  type        = string
  default     = null
}

variable "recovery_window_in_days" {
  description = "Recovery window before deletion"
  type        = number
  default     = 7
}

variable "enable_rotation" {
  description = "Enable automatic rotation"
  type        = bool
  default     = false
}

variable "rotation_lambda_arn" {
  description = "Lambda ARN for secret rotation"
  type        = string
  default     = null
}

variable "rotation_days" {
  description = "Rotation frequency in days"
  type        = number
  default     = 30
}

variable "tags" {
  type    = map(string)
  default = {}
}
