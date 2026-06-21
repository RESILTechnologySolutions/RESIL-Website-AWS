# Security Decisions

## Purpose

This document explains the main security decisions used for the RESIL Technology Solutions AWS website deployment.

## S3 Security

The website files are stored in Amazon S3, but the S3 bucket is not public.

Security choices:

- Block public access is enabled
- Public ACLs are blocked
- Public bucket policies are blocked
- Bucket ownership is enforced
- Website files are served through CloudFront, not directly from S3

## CloudFront Security

CloudFront is the public entry point for the website.

Security choices:

- HTTPS is enforced
- HTTP traffic redirects to HTTPS
- TLS minimum protocol is set to TLSv1.2_2021
- CloudFront uses Origin Access Control to access the private S3 bucket

## DNS and HTTPS

Route 53 manages DNS for the domain.

Security choices:

- Domain points to CloudFront using Route 53 alias records
- ACM provides the HTTPS certificate
- Certificate validation uses DNS validation

## CI/CD Security

GitHub Actions deploys the website automatically.

Security choices:

- GitHub Actions uses OIDC
- No long-term AWS access keys are stored in GitHub
- IAM role trust is limited to the RESIL-Website-AWS repo
- IAM permissions are limited to S3 deployment and CloudFront invalidation

## Cost-Aware Security

This design avoids unnecessary always-running infrastructure.

Avoided services:

- EC2
- NAT Gateway
- Load Balancer
- Kubernetes
- Always-running containers
