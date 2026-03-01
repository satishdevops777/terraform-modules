provider "aws" {
  region = var.region
}

module "public_dns" {
  source = "../../modules/route53"

  zone_name    = "example.com"
  private_zone = false

  records = [
    {
      name    = "www"
      type    = "A"
      ttl     = 300
      records = ["1.2.3.4"]
    },
    {
      name = "app"
      type = "CNAME"
      ttl  = 300
      records = ["example.com"]
    }
  ]

  tags = {
    Environment = "dev"
    Owner       = "satish"
  }
}

module "private_dns" {
  source = "../../modules/route53"

  zone_name    = "internal.example.com"
  private_zone = true
  vpc_id       = var.vpc_id

  records = [
    {
      name    = "db"
      type    = "A"
      ttl     = 300
      records = ["10.0.1.10"]
    }
  ]
}

{
  name = "app"
  type = "A"
  alias = {
    name                   = "dualstack-alb-123.ap-south-1.elb.amazonaws.com"
    zone_id                = "ZP97RAFLXTNZK"
    evaluate_target_health = true
  }
}
