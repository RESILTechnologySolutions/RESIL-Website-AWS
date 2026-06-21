# Cost Breakdown

## Purpose

This project is designed as a low-cost production business website and portfolio showcase.

## Estimated Monthly Cost

| Service | Purpose | Estimated Cost |
|---|---|---:|
| Route 53 Hosted Zone | DNS hosting for resiltechnologysolutions.com | About $0.50/month |
| ACM | HTTPS certificate | Free |
| S3 | Static website file storage | Near free |
| CloudFront | CDN, HTTPS, caching | Free or near free for low traffic |
| IAM | GitHub Actions deployment role | Free |

## Cost Control Decisions

- Static website only
- No EC2 servers
- No load balancer
- No NAT Gateway
- No always-running compute
- Small S3 storage footprint
- CloudFront used for caching and HTTPS

## Current Expected Cost

The only predictable recurring cost is the Route 53 hosted zone, about $0.50/month.
