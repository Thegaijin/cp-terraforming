resource "aws_security_group" "cp-tf-public-sg" {
  name   = "cp-tf-public-sg"
  vpc_id = "${aws_vpc.cp_tf_vpc_02060600.id}"

  # SSH access from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP access from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # ICMP access from anywhere
  ingress {
    from_port   = "-1"
    to_port     = "-1"
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "cp-tf-public-sg"
  }
}

resource "aws_security_group" "cp-tf-private-sg" {
  name   = "cp-tf-private-sg"
  vpc_id = "${aws_vpc.cp_tf_vpc_02060600.id}"

  # SSH access from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["172.32.0.0/16"]
  }

  # HTTP access from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["172.32.0.0/16"]
  }

  # Outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "cp-tf-private-sg"
  }
}

resource "aws_security_group" "cp-tf-nat-sg" {
  name   = "cp-tf-nat-sg"
  vpc_id = "${aws_vpc.cp_tf_vpc_02060600.id}"

  # SSH access from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["172.32.0.0/16"]
  }

  # HTTP access from anywhere
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    security_groups = ["${aws_security_group.cp-tf-private-sg.id}", "${aws_security_group.cp-tf-public-sg.id}"]
  }

  # HTTPS access from anywhere
  ingress {
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    security_groups = ["${aws_security_group.cp-tf-private-sg.id}", "${aws_security_group.cp-tf-public-sg.id}"]
  }

  # Custom port access from anywhere
  ingress {
    from_port   = 10235
    to_port     = 10235
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "cp-tf-nat-sg"
  }
}

resource "aws_security_group" "cp_tf_rds_sg" {
  name = "cp_tf_rds_sg"

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["172.32.101.0/24", "172.32.102.0/24"]
  }

  # Outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "cp_tf_rds_sg"
  }
}

resource "aws_security_group" "cp_tf_elb_sg" {
  name   = "cp_tf_elb_sg"
  vpc_id = "${aws_vpc.cp_tf_vpc_02060600.id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "cp_tf_elb_sg"
  }
}
