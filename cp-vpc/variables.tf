variable "region" {
  default = "us-east-2"
}

variable "zone_a" {
  default = "us-east-2a"
}

variable "zone_b" {
  default = "us-east-2b"
}

variable "vpc_cidr" {
  default = "172.32.0.0/16"
}

variable "pub_subnet1_cidr" {
  default = "172.32.1.0/24"
}

variable "pub_subnet2_cidr" {
  default = "172.32.2.0/24"
}

variable "priv_subnet1_cidr" {
  default = "172.32.101.0/24"
}

variable "priv_subnet2_cdir" {
  default = "172.32.102.0/24"
}

# variable "azs" {
#   type    = "list"
#   default = ["us-east-2a", "us-east-2b"]
# }

# variable "public_subnet_cidr" {
#   type    = "list"
#   default = ["172.32.1.0/24", "172.32.2.0/24"]
# }

# variable "private_subnet_cidr" {
#   type    = "list"
#   default = ["172.32.101.0/24", "172.32.102.0/24"]
# }

variable "cp3_ami_id" {
  default = "ami-000989eca0f354568"
}

variable "cp4_ami_id" {
  default = "ami-0ab1a4ddeed1124dd"
}

variable "cp_nat_ami_id" {
  default = "ami-0247759dfcce1385a"
}

variable "key_pair" {
  default = "cp-us-east-2-key-pair"
}
