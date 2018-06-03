resource "aws_instance" "cp3_tf_03061145" {
  ami           = "${var.cp3_ami_id}"
  instance_type = "t2.micro"
  subnet_id     = "${aws_subnet.cp_tf_priv_subnet-1.id}"
  key_name      = "${var.key_pair}"

  tags {
    Name = "cp3_tf_03061145"
  }
}

resource "aws_instance" "cp4_tf_03061145" {
  ami           = "${var.cp4_ami_id}"
  instance_type = "t2.micro"
  subnet_id     = "${aws_subnet.cp_tf_pub_subnet-1.id}"
  key_name      = "${var.key_pair}"

  tags {
    Name = "cp4_tf_03061145"
  }
}

resource "aws_instance" "cp_tf_nat_03061145" {
  ami               = "${var.cp_nat_ami_id}"
  instance_type     = "t2.micro"
  subnet_id         = "${aws_subnet.cp_tf_pub_subnet-1.id}"
  source_dest_check = false
  key_name          = "${var.key_pair}"

  tags {
    Name = "cp_tf_nat_03061145"
  }
}
