resource "aws_lb_listener" "cp_tf_frontend_alb_listener" {
  load_balancer_arn = "${aws_lb.cp_tf_frontend_alb.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_lb_target_group.cp_tf_frontend_tg.arn}"
    type             = "forward"
  }
}

# API ELB listener
resource "aws_lb_listener" "cp_tf_api_alb_listener" {
  load_balancer_arn = "${aws_lb.cp_tf_api_alb.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_lb_target_group.cp_tf_api_tg.arn}"
    type             = "forward"
  }
}
