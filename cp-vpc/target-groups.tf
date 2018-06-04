#API Target group
resource "aws_lb_target_group" "cp_tf_api_tg" {
  name     = "cp-tf-api-tg"
  port     = "80"
  protocol = "HTTP"
  vpc_id   = "${aws_vpc.cp_tf_vpc_02060600.id}"
}

resource "aws_lb_target_group_attachment" "attach_api_zone_a" {
  target_group_arn = "${aws_lb_target_group.cp_tf_api_tg.arn}"
  target_id        = "${aws_instance.cp3_tf_03061145.id}"
  port             = "80"
}

# Frontend Target group
resource "aws_lb_target_group" "cp_tf_frontend_tg" {
  name     = "cp-tf-frontend-tg"
  port     = "80"
  protocol = "HTTP"
  vpc_id   = "${aws_vpc.cp_tf_vpc_02060600.id}"
}

# Backend Zone A
resource "aws_lb_target_group_attachment" "attach_frontend_zone_a" {
  target_group_arn = "${aws_lb_target_group.cp_tf_frontend_tg.arn}"
  target_id        = "${aws_instance.cp4_tf_03061145.id}"
  port             = "80"
}
