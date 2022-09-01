resource "aws_ecr_repository" "curt_demo" {
  name                 = "curt-demo"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}