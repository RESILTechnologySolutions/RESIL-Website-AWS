output "root_s3_bucket_name" {
  description = "Name of the root website S3 bucket"
  value       = aws_s3_bucket.root_site.bucket
}
