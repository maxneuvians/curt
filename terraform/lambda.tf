data "aws_caller_identity" "current" {}

module "curt_demo_lambda" {
  source                 = "github.com/cds-snc/terraform-modules?ref=v3.0.5//lambda"
  name                   = "curt_demo"
  billing_tag_value      = var.billing_code
  ecr_arn                = aws_ecr_repository.curt_demo.arn
  enable_lambda_insights = true
  image_uri              = "${aws_ecr_repository.curt_demo.repository_url}:latest"
  memory                 = 512
  timeout                = 300


  environment_variables = {
    APP_URL       = "https://curt-demo.cdssandbox.xyz"
  }

  policies = [
    data.aws_iam_policy_document.curt_demo_lambda_policies.json,
  ]
}

resource "aws_lambda_function_url" "curt_demo_url" {
  # checkov:skip=CKV_AWS_258: Lambda function url auth is handled at the API level
  function_name      = module.curt_demo_lambda.function_name
  authorization_type = "NONE"

  cors {
    allow_credentials = true
    allow_origins     = ["*"]
    allow_methods     = ["*"]
    max_age           = 86400
  }
}