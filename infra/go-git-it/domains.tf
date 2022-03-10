resource "aws_route53_zone" "hackathon_public" {
    name = "gogitit.online"
}

resource "aws_route53_record" "hackathon_80" {
  zone_id = aws_route53_zone.hackathon_public.zone_id
  name    = "gogitit.online"
  type    = "A"
  ttl     = "30"
  records = aws_instance.hackathon_instance.public_ip
}
