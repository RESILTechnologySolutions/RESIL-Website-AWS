resource "aws_s3_bucket" "www_redirect" {
  bucket = "www.${var.domain_name}"

  tags = {
    Project = "RESIL Website AWS"
    Owner   = "RESIL Technology Solutions"
  }
}

resource "aws_s3_bucket_public_access_block" "www_redirect" {
  bucket = aws_s3_bucket.www_redirect.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_ownership_controls" "www_redirect" {
  bucket = aws_s3_bucket.www_redirect.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}
