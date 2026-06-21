# Architecture

## Overview

This project hosts the RESIL Technology Solutions business website on AWS using a secure static website architecture.

## Request Flow

    Visitor
      -> resiltechnologysolutions.com
      -> Route 53 DNS
      -> CloudFront
      -> Private S3 bucket

## Components

### Namecheap

Namecheap remains the domain registrar.

Its nameservers are changed to AWS Route 53 nameservers.

### Route 53

Route 53 manages DNS records for:

- resiltechnologysolutions.com
- www.resiltechnologysolutions.com

Both records point to CloudFront.

### CloudFront

CloudFront serves the website over HTTPS and caches static files globally.

CloudFront is the only public entry point for website traffic.

### S3

S3 stores the website files:

- index.html
- RESILLogo2.png

The S3 bucket is private and cannot be accessed directly by the public.

### ACM

AWS Certificate Manager provides the HTTPS certificate for the root and www domains.

### GitHub Actions

GitHub Actions deploys website changes automatically when code is pushed to main.

## Final Architecture

    GitHub push
      -> GitHub Actions
      -> AWS IAM role through OIDC
      -> S3 sync
      -> CloudFront invalidation
      -> Live website update
