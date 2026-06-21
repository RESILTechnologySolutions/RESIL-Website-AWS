# RESIL Website AWS Deployment

Secure Static Business Website Deployment on AWS with Terraform and GitHub Actions.

## Live Website

- https://resiltechnologysolutions.com
- https://www.resiltechnologysolutions.com

## Project Overview

This project deploys the RESIL Technology Solutions business website as a secure, low-cost static website on AWS.

## Architecture

    Namecheap
      -> Route 53
      -> CloudFront
      -> Private S3 bucket

## Technology Used

- AWS S3
- AWS CloudFront
- AWS Certificate Manager
- AWS Route 53
- AWS IAM
- Terraform
- GitHub Actions
- GitHub OIDC

## Documentation

- [Architecture](docs/architecture.md)
- [Deployment Summary](docs/deployment-summary.md)
- [Security Decisions](docs/security-decisions.md)
- [Cost Breakdown](docs/cost-breakdown.md)
- [Troubleshooting Notes](docs/troubleshooting.md)

## CI/CD

Website updates are deployed automatically through GitHub Actions when changes are pushed to the main branch.

Deployment flow:

    Push to main
      -> GitHub Actions
      -> Assume AWS IAM role with OIDC
      -> Sync website files to S3
      -> Invalidate CloudFront cache

## Security Highlights

- Private S3 bucket
- S3 public access blocked
- CloudFront Origin Access Control
- HTTPS through ACM
- GitHub Actions uses OIDC instead of long-term AWS keys
- Least-privilege IAM deployment role

## Cost Awareness

This project avoids always-running compute services.

Expected recurring cost is mainly the Route 53 hosted zone, about $0.50/month.
