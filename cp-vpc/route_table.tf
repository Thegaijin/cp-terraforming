# resource "aws_elb" "backend-elb" {
#   name = "backend-elb"
# }

resource "aws_internet_gateway" "cp_tf_igw" {
  vpc_id = "${aws_vpc.cp_tf_vpc_02060600.id}"
}

resource "aws_route_table" "cp_tf_rtb" {
  vpc_id = "${aws_vpc.cp_tf_vpc_02060600.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.cp_tf_igw.id}"
  }

  tags {
    Name = "cp_tf_custom_rtb"
  }
}

resource "aws_route_table_association" "cp_tf_rta_subnet1" {
  subnet_id      = "${aws_subnet.cp_tf_pub_subnet-1.id}"
  route_table_id = "${aws_route_table.cp_tf_rtb.id}"
}

resource "aws_route_table_association" "cp_tf_rta_subnet2" {
  subnet_id      = "${aws_subnet.cp_tf_pub_subnet-2.id}"
  route_table_id = "${aws_route_table.cp_tf_rtb.id}"
}

resource "aws_default_route_table" "r" {
  default_route_table_id = "${aws_vpc.cp_tf_vpc_02060600.default_route_table_id}"

  route {
    cidr_block  = "0.0.0.0/0"
    instance_id = "${aws_instance.cp_tf_nat_03061145.id}"
  }

  tags {
    Name = "cp-tf-default-rt"
  }
}
