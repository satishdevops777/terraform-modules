provider "aws" {
  region = var.region
}

module "secure_bucket" {
  source = "../../modules/s3-bucket"

  bucket_name = "company-dev-secure-bucket"
  kms_key_arn = var.kms_key_arn

  transition_days = 30
  expiration_days = 365

  tags = {
    Environment = "dev"
    Owner       = "satish"
    ManagedBy   = "Terraform"
  }
}
