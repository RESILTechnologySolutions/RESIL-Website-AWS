# Troubleshooting Notes

## DNS Still Pointed to GitHub Pages

### Problem

After moving the domain to AWS, local DNS still resolved resiltechnologysolutions.com to GitHub Pages IP addresses:

- 185.199.108.153
- 185.199.109.153
- 185.199.110.153
- 185.199.111.153

The website also returned GitHub headers.

### Cause

The AWS infrastructure was correct, but local DNS was stale.

Public DNS through Google and Cloudflare showed the correct AWS Route 53 nameservers and CloudFront IP addresses.

### Fix

WSL DNS was temporarily updated to use public DNS resolvers:

- 8.8.8.8
- 1.1.1.1

After that, the domain correctly resolved to CloudFront.

### Verification

Successful AWS response showed:

- server: AmazonS3
- via: CloudFront
- x-cache: cloudfront

## GitHub Pages Cleanup

The previous GitHub Pages custom domain was removed so GitHub Pages no longer controlled resiltechnologysolutions.com.
