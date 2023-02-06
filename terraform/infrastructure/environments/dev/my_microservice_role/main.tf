terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>3.0"
    }
  }
}

output "MyMicroserviceRoleArn" {
  value = aws_iam_role.MyMicroserviceRole.arn
}

resource "aws_iam_role" "MyMicroserviceRole" {
  name                 = "My-microservice-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy" "lambda_policy" {
  name = "lambda_policy"
  role = aws_iam_role.MyMicroserviceRole.name

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Sid": "",
      "Resource": "*"
    }
  ]
}
POLICY
}

