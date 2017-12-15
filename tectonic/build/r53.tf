resource "aws_route53_zone" "ctisand" {
  name    = "ctisand.phz"
  comment = "Zone for arbitrary testing"
}

resource "aws_route53_zone" "spin-up" {
  name = "spinup.ctisand.phz"
  tags {
    Environment = "Sandbox"
  }
}

resource "aws_route53_record" "spin-up-ns" {
  name    = "spinup.ctisand.phz"
  type    = "NS"
  zone_id = "${aws_route53_zone.ctisand.zone_id}"
  ttl     = 30

  records = [
    "${aws_route53_zone.spin-up.name_servers.0}",
    "${aws_route53_zone.spin-up.name_servers.1}",
    "${aws_route53_zone.spin-up.name_servers.2}",
    "${aws_route53_zone.spin-up.name_servers.3}"
  ]
}

resource "aws_route53_record" "test-spin-up" {
  name    = "test"
  type    = "A"
  zone_id = "${aws_route53_zone.spin-up.id}"
  ttl     = 300
  records = ["172.16.0.48"]
}
