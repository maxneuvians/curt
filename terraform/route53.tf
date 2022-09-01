resource "aws_route53_zone" "curt_demo" {
  name = "curt-demo.cdssandbox.xyz"

  tags = {
    "CostCentre" = var.billing_code
  }
}