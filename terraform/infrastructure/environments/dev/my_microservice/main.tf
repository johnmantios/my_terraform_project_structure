terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>3.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
  alias  = "eu-central-1"
}

module "my_module" {
  source = "../../../modules/my_microservice"

  env = var.env

  providers = {
    aws = aws.eu-central-1
  }
}
