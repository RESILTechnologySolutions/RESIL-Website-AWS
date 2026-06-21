variable "aws_region" {
  description = "Primary AWS region for website infrastructure"
  type        = string
  default     = "us-east-1"
}

variable "domain_name" {
  description = "Root domain name for the RESIL website"
  type        = string
  default     = "resiltechnologysolutions.com"
}
