resource "aws_lb" "cp_tf_api_alb" {
  name = "cp-tf-api-elb"

  internal           = false
  load_balancer_type = "application"
  subnets            = ["${aws_subnet.cp_tf_pub_subnet-1.id}", "${aws_subnet.cp_tf_pub_subnet-2.id}"]
  security_groups    = ["${aws_security_group.cp-tf-public-sg.id}"]

  tags {
    Name = "cp_tf_api_alb"
  }
}

resource "aws_lb" "cp_tf_frontend_alb" {
  name = "cp-tf-frontend-elb"

  internal           = false
  load_balancer_type = "application"
  subnets            = ["${aws_subnet.cp_tf_pub_subnet-1.id}", "${aws_subnet.cp_tf_pub_subnet-2.id}"]
  security_groups    = ["${aws_security_group.cp-tf-public-sg.id}"]

  tags {
    Name = "cp_tf_frontend_axlb"
  }
}
