data "aws_route53_zone" "zone" {
  name         = var.zone-name
  private_zone = false # This cannot be used with a private zone
}

resource "aws_route53_record" "a" {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = "tester-${var.cluster-prefix}"
  type    = "A"
  ttl     = "300"
  records = var.tester-records
}

resource "aws_route53_record" "glue" {
  count   = length(var.node-external-ips)
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = "ns${count.index}.${var.cluster-prefix}.${var.zone-name}."
  type    = "A"
  ttl     = "300"
  records = [element(var.node-external-ips, count.index)]
}

resource "aws_route53_record" "ns" {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = "${var.cluster-prefix}.${var.zone-name}"
  type    = "NS"
  ttl     = "300"
  records = formatlist("ns%s.${var.cluster-prefix}.${var.zone-name}", range(length(var.node-external-ips)))
}
