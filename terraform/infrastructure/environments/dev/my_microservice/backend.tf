terraform {
  backend "s3" {
    bucket = "application-${env}"
    key    = "my_microservice/terraform.tfstate"
    region = "eu-central-1"  
    }
}

