resource "aws_route53_record" "email_mx" {
  zone_id = aws_route53_zone.main.zone_id
  name    = var.domain_name
  type    = "MX"
  ttl     = 300

  records = [
    "0 resiltechnologysolutions-com.mail.protection.outlook.com"
  ]
}

resource "aws_route53_record" "email_spf" {
  zone_id = aws_route53_zone.main.zone_id
  name    = var.domain_name
  type    = "TXT"
  ttl     = 300

  records = [
    "v=spf1 include:spf.protection.outlook.com -all"
  ]
}

resource "aws_route53_record" "email_autodiscover" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "autodiscover.${var.domain_name}"
  type    = "CNAME"
  ttl     = 300

  records = [
    "autodiscover.outlook.com"
  ]
}

resource "aws_route53_record" "email_dmarc" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "_dmarc.${var.domain_name}"
  type    = "TXT"
  ttl     = 300

  records = [
    "v=DMARC1; p=none; rua=mailto:postmaster@${var.domain_name}"
  ]
}