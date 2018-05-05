/**
 * Route53 Alias record.
 */
resource "aws_route53_record" "route_record" {
  zone_id = "${var.route53_public_zoneid}"
  name    = "${var.route53_endpoint}"
  type    = "A"

  alias {
    name                   = "${aws_alb.alb.dns_name}"
    zone_id                = "${aws_alb.alb.zone_id}"
    evaluate_target_health = true
  }

  depends_on = ["aws_alb.alb"]
}