terraform {
  backend "s3" {
    bucket = "security-${env}"
    key    = "my_microservice_role/terraform.tfstate"
    region = "eu-central-1"  
    }
}
