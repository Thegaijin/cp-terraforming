provider "aws" {
  region = "${var.region}"
}

resource "aws_vpc" "cp_tf_vpc_02060600" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "default"

  tags {
    Name     = "cp_tf_vpc_02060600"
    Location = "st_cat"
  }
}

resource "aws_subnet" "cp_tf_pub_subnet-1" {
  vpc_id            = "${aws_vpc.cp_tf_vpc_02060600.id}"
  cidr_block        = "${var.pub_subnet1_cidr}"
  availability_zone = "${var.zone_a}"

  tags {
    Name = "cp_tf_pub_subnet1"
  }
}

resource "aws_subnet" "cp_tf_pub_subnet-2" {
  vpc_id            = "${aws_vpc.cp_tf_vpc_02060600.id}"
  cidr_block        = "${var.pub_subnet2_cidr}"
  availability_zone = "${var.zone_b}"

  tags {
    Name = "cp_tf_pub_subnet2"
  }
}

resource "aws_subnet" "cp_tf_priv_subnet-1" {
  vpc_id            = "${aws_vpc.cp_tf_vpc_02060600.id}"
  cidr_block        = "${var.priv_subnet1_cidr}"
  availability_zone = "${var.zone_a}"

  tags {
    Name = "cp_tf_priv_subnet1"
  }
}

resource "aws_subnet" "cp_tf_priv_subnet-2" {
  vpc_id            = "${aws_vpc.cp_tf_vpc_02060600.id}"
  cidr_block        = "${var.priv_subnet2_cdir}"
  availability_zone = "${var.zone_b}"

  tags {
    Name = "cp_tf_priv_subnet2"
  }
}

# resource "aws_subnet" "cp_tf_pub_subnets" {
#   count             = "${length(var.azs)}"
#   vpc_id            = "${aws_vpc.cp_tf_vpc_02060600.id}"
#   cidr_block        = "${element(var.public_subnet_cidr, count.index)}"
#   availability_zone = "${element(var.azs, count.index)}"


#   tags {
#     Name = "cp_tf_pub_subnet-${count.index+1}"
#   }
# }


# resource "aws_subnet" "cp_tf_priv_subnets" {
#   count             = "${length(var.azs)}"
#   vpc_id            = "${aws_vpc.cp_tf_vpc_02060600.id}"
#   cidr_block        = "${element(var.private_subnet_cidr, count.index)}"
#   availability_zone = "${element(var.azs, count.index)}"


#   tags {
#     Name = "cp_tf_priv_subnet-${count.index+1}"
#   }
# }
