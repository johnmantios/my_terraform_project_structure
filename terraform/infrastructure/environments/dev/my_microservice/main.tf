provider "aws" {
  region = "us-east-1"
  alias  = "us-east-1"
}

module "my_module" {
  source = "../../../modules/my_module"

  env = var.env

  providers = {
    aws = aws.us-east-1
  }
}
