variable "region" {}
variable "name" {}
variable "ami_id" {}
variable "instance_type" {}
variable "subnet_id" {}
variable "vpc_id" {}
variable "key_name" {}
variable "root_volume_size" { default = 30 }
variable "additional_ebs_size" { default = 100 }
variable "kms_key_id" { default = null }
