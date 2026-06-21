resource "aws_s3_bucket" "root_site" {
  bucket = var.domain_name

  tags = {
    Project = "RESIL Website AWS"
    Owner   = "RESIL Technology Solutions"
  }
}

resource "aws_s3_bucket_public_access_block" "root_site" {
  bucket = aws_s3_bucket.root_site.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_ownership_controls" "root_site" {
  bucket = aws_s3_bucket.root_site.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}
