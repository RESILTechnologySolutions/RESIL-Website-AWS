resource "aws_cloudfront_origin_access_control" "site" {
  name                              = "resil-website-oac"
  description                       = "OAC for RESIL private S3 website bucket"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}
