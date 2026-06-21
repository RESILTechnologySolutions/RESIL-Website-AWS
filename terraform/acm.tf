resource "aws_acm_certificate" "site" {
  provider = aws.use1

  domain_name               = var.domain_name
  subject_alternative_names = ["www.${var.domain_name}"]
  validation_method         = "DNS"

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Project = "RESIL Website AWS"
    Owner   = "RESIL Technology Solutions"
  }
}
