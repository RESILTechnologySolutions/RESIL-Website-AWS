# RESIL Website AWS Deployment

Professional static business website deployment for RESIL Technology Solutions using AWS, Terraform, CloudFront, S3, Route 53, ACM, and GitHub Actions.

## Project Goal

Rebuild resiltechnologysolutions.com as a secure, low-cost AWS-hosted static website and portfolio showcase project.

## Planned Architecture

- Amazon S3 for static website files
- Amazon CloudFront for HTTPS delivery and caching
- AWS Certificate Manager for TLS certificate
- Amazon Route 53 for DNS
- Terraform for infrastructure as code
- GitHub Actions for CI/CD deployment
- GitHub OIDC for secure AWS authentication

## Cost Awareness

This project is designed to stay low-cost.

Expected monthly cost:
- Route 53 hosted zone: about $0.50/month
- ACM certificate: free
- S3: near free for a tiny static site
- CloudFront: likely free/near free for low traffic

No AWS resources should be created without reviewing cost impact first.