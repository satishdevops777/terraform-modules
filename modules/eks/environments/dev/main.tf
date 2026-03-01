provider "aws" {
  region = var.region
}

module "eks" {
  source = "../../modules/eks"

  cluster_name    = "dev-eks"
  cluster_version = "1.29"

  vpc_id             = var.vpc_id
  private_subnet_ids = var.private_subnet_ids

  node_groups = {
    default = {
      instance_types = ["t3.medium"]
      desired_size   = 2
      min_size       = 1
      max_size       = 3
      disk_size      = 20
      capacity_type  = "ON_DEMAND"
    }
  }

  tags = {
    Environment = "dev"
    Owner       = "satish"
  }
}
