provider "aws" {
  region = var.region
}

module "db_secret" {
  source = "../../modules/secrets-manager"

  name        = "dev-db-credentials"
  description = "Database credentials for dev"

  secret_string = jsonencode({
    username = "admin"
    password = "SuperSecurePassword123!"
  })

  recovery_window_in_days = 7

  tags = {
    Environment = "dev"
    Owner       = "satish"
  }
}
