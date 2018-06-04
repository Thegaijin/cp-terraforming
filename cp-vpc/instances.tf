resource "aws_instance" "cp3_tf_03061145" {
  ami                    = "${data.aws_ami.cp_api_image.id}"
  instance_type          = "t2.micro"
  subnet_id              = "${aws_subnet.cp_tf_priv_subnet-1.id}"
  vpc_security_group_ids = ["${aws_security_group.cp-tf-private-sg.id}"]
  key_name               = "${var.key_pair}"

  tags {
    Name = "cp3_tf_03061145"
  }
}

resource "aws_instance" "cp4_tf_03061145" {
  ami                    = "${data.aws_ami.cp_frontend_image.id}"
  instance_type          = "t2.micro"
  subnet_id              = "${aws_subnet.cp_tf_pub_subnet-1.id}"
  vpc_security_group_ids = ["${aws_security_group.cp-tf-public-sg.id}"]
  key_name               = "${var.key_pair}"

  tags {
    Name = "cp4_tf_03061145"
  }
}

resource "aws_instance" "cp_tf_nat_03061145" {
  ami                    = "${data.aws_ami.cp_nat_image.id}"
  instance_type          = "t2.micro"
  subnet_id              = "${aws_subnet.cp_tf_pub_subnet-1.id}"
  vpc_security_group_ids = ["${aws_security_group.cp-tf-nat-sg.id}", "${aws_security_group.cp-tf-public-sg.id}"]
  source_dest_check      = false
  key_name               = "${var.key_pair}"

  tags {
    Name = "cp_tf_nat_03061145"
  }
}
