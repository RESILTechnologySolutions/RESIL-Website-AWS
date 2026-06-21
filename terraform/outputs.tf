output "root_s3_bucket_name" {
  description = "Name of the root website S3 bucket"
  value       = aws_s3_bucket.root_site.bucket
}

output "www_s3_bucket_name" {
  description = "Name of the www redirect S3 bucket"
  value       = aws_s3_bucket.www_redirect.bucket
}

output "route53_nameservers" {
  description = "Nameservers to set at Namecheap after Route 53 hosted zone is created"
  value       = aws_route53_zone.main.name_servers
}
