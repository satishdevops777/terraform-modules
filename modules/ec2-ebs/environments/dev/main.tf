terraform {
  backend "s3" {
    bucket         = "company-dev-terraform-state"
    key            = "ec2/dev.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-lock"
  }
}

provider "aws" {
  region = var.region
}

module "ec2" {
  source = "../../modules/ec2"

  name              = var.name
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  subnet_id         = var.subnet_id
  vpc_id            = var.vpc_id
  key_name          = var.key_name
  root_volume_size  = var.root_volume_size
  additional_ebs_size = var.additional_ebs_size
  kms_key_id        = var.kms_key_id

  tags = {
    Environment = "dev"
    Owner       = "satish"
  }
}
