terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket                      = "company-dev-terraform-state"
    key                         = "ec2/dev/terraform.tfstate"
    region                      = "ap-south-1"

    # Security
    encrypt                     = true
    kms_key_id                  = "arn:aws:kms:ap-south-1:123456789012:key/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"

    # State locking
    dynamodb_table              = "terraform-lock"
    
    # Access configuration
    profile                     = "dev-profile"
    shared_credentials_file     = "~/.aws/credentials"

    # Optional advanced settings
    skip_region_validation      = false
    skip_credentials_validation = false
    skip_metadata_api_check     = false
    force_path_style            = false
  }
}
