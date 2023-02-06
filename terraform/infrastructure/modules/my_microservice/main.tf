resource "aws_lambda_function" "test_lambda" {

  function_name = "lambda_function_name"
  role          = data.terraform_remote_state.MyMicroserviceRoleArn.outputs.MyMicroserviceRoleArn

}

data "terraform_remote_state" "MyMicroserviceRoleArn" {
  backend = "s3"
  config = {
    bucket = "security"
    key    = "my_microservice_role/terraform.tfstate"
    region = "eu-central-1"
  }

}