variable "name" { type = string }
variable "ami_id" { type = string }
variable "instance_type" { type = string }
variable "subnet_id" { type = string }
variable "vpc_id" { type = string }
variable "key_name" { type = string }

variable "associate_public_ip_address" {
  type    = bool
  default = false
}

variable "root_volume_size" {
  type    = number
  default = 20
}

variable "root_volume_type" {
  type    = string
  default = "gp3"
}

variable "root_encrypted" {
  type    = bool
  default = true
}

variable "kms_key_id" {
  type    = string
  default = null
}

variable "additional_ebs_size" {
  type    = number
  default = 50
}

variable "additional_ebs_type" {
  type    = string
  default = "gp3"
}

variable "additional_ebs_device_name" {
  type    = string
  default = "/dev/sdh"
}

variable "tags" {
  type    = map(string)
  default = {}
}
