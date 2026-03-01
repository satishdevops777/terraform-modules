provider "aws" {
  region = var.region
}

module "iam_user" {
  source = "../../modules/iam"

  create_user        = true
  user_name          = "dev-user"
  create_access_key  = true

  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
  ]

  tags = {
    Environment = "dev"
    Owner       = "satish"
  }
}

module "iam_role" {
  source = "../../modules/iam"

  create_role = true
  role_name   = "ec2-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = { Service = "ec2.amazonaws.com" }
      Action = "sts:AssumeRole"
    }]
  })

  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  ]
}
