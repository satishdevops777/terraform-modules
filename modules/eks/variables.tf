variable "cluster_name" { type = string }
variable "cluster_version" { type = string }

variable "vpc_id" { type = string }
variable "private_subnet_ids" { type = list(string) }

variable "node_groups" {
  description = "Managed node group configuration"
  type = map(object({
    instance_types = list(string)
    desired_size   = number
    min_size       = number
    max_size       = number
    disk_size      = number
    capacity_type  = string # ON_DEMAND or SPOT
  }))
}

variable "tags" {
  type    = map(string)
  default = {}
}
