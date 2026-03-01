variable "create_user" {
  type    = bool
  default = false
}

variable "user_name" {
  type    = string
  default = null
}

variable "create_access_key" {
  type    = bool
  default = false
}

variable "create_role" {
  type    = bool
  default = false
}

variable "role_name" {
  type    = string
  default = null
}

variable "assume_role_policy" {
  type    = string
  default = null
}

variable "managed_policy_arns" {
  type    = list(string)
  default = []
}

variable "inline_policy_json" {
  type    = string
  default = null
}

variable "tags" {
  type    = map(string)
  default = {}
}
