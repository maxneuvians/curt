data "aws_iam_policy_document" "curt_demo_lambda_policies" {

  statement {

    effect = "Allow"

    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]

    resources = [
      "arn:aws:logs:ca-central-1:${data.aws_caller_identity.current.account_id}:log-group:*"
    ]
  }

  statement {
    effect = "Allow"
    actions = [
      "ssm:GetParameters",
    ]
    resources = [
      "arn:aws:ssm:ca-central-1:${data.aws_caller_identity.current.account_id}:parameter/curt-demo"
    ]
  }

  statement {

    effect = "Allow"

    actions = [
      "lambda:InvokeFunction"
    ]
    resources = [
      module.curt_demo_lambda.function_arn
    ]
  }
}