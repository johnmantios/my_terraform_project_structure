terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_role" "IAMRole" {
  path                 = "/"
  name                 = "My lambda role dev"
  assume_role_policy   = "TODO"
  max_session_duration = 3600
  permissions_boundary = "TODO"
  tags                 = "TODO"
}

resource "aws_iam_policy" "IAMManagedPolicy1" {
  name = "my_policy_name"
  path = "/"
  role = aws_iam_role.IAMRole.name

  policy = <<EOF
  {}
  EOF
}

resource "aws_iam_policy" "IAMManagedPolicy2" {
  name = "my_policy_name"
  path = "/"
  role = aws_iam_role.IAMRole.name

  policy = <<EOF
  {}
  EOF
}
