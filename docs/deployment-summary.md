# Deployment Summary

## Project

Secure Static Business Website Deployment on AWS with Terraform and GitHub Actions

## Live URLs

- https://resiltechnologysolutions.com
- https://www.resiltechnologysolutions.com

## Architecture

Namecheap delegates DNS to Route 53. Route 53 points the root and www domains to CloudFront. CloudFront serves the private S3 bucket through Origin Access Control.

Architecture flow:

    Namecheap
      -> Route 53
      -> CloudFront
      -> Private S3 bucket

## Infrastructure

Provisioned with Terraform:

- S3 bucket for website files
- S3 bucket for www support
- S3 public access blocked
- CloudFront Origin Access Control
- CloudFront distribution
- ACM certificate in us-east-1
- Route 53 hosted zone
- Route 53 DNS records
- IAM role for GitHub Actions deployment

## CI/CD

GitHub Actions deploys automatically on push to main when website files change.

Workflow:

    Push to main
      -> GitHub Actions
      -> Assume AWS IAM role with OIDC
      -> Sync website files to S3
      -> Invalidate CloudFront cache

## Security Decisions

- S3 bucket is private
- Public S3 access is blocked
- CloudFront uses Origin Access Control
- HTTPS is provided by ACM
- GitHub Actions uses OIDC instead of long-term AWS keys
- IAM permissions are limited to S3 deploy actions and CloudFront invalidation

## Cost Notes

Expected monthly cost is low:

- Route 53 hosted zone: about $0.50/month
- ACM certificate: free
- S3: near free for tiny static website files
- CloudFront: likely free or near free for low traffic
