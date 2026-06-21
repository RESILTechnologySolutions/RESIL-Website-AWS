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

output "acm_certificate_arn" {
  description = "ACM certificate ARN used by CloudFront"
  value       = aws_acm_certificate.site.arn
}

output "cloudfront_distribution_id" {
  description = "CloudFront distribution ID"
  value       = aws_cloudfront_distribution.site.id
}

output "cloudfront_domain_name" {
  description = "CloudFront distribution domain name"
  value       = aws_cloudfront_distribution.site.domain_name
}

output "live_site_url" {
  description = "Final production website URL"
  value       = "https://${var.domain_name}"
}

output "www_site_url" {
  description = "Final www website URL"
  value       = "https://www.${var.domain_name}"
}
