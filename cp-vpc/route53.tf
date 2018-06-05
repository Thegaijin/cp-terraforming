# React CNAME record
resource "aws_route53_record" "cp_frontend_dns_cname" {
  zone_id = "${data.aws_route53_zone.my_domain.zone_id}"
  name    = "tfrecipe"
  type    = "CNAME"
  ttl     = "300"
  records = ["${aws_lb.cp_tf_frontend_alb.dns_name}"]
}

# API CNAME Record
resource "aws_route53_record" "cp_api_dns_cname" {
  zone_id = "${data.aws_route53_zone.my_domain.zone_id}"
  name    = "tfapi"
  type    = "CNAME"
  ttl     = "300"
  records = ["${aws_lb.cp_tf_api_alb.dns_name}"]
}
