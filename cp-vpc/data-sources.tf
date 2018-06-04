# API image filter
data "aws_ami" "cp_api_image" {
  filter {
    name   = "name"
    values = ["cp_api_image-*"]
  }

  most_recent = true
}

# Frontend image filter
data "aws_ami" "cp_frontend_image" {
  filter {
    name   = "name"
    values = ["cp_frontend_image-*"]
  }

  most_recent = true
}

# Nat image filter
data "aws_ami" "cp_nat_image" {
  filter {
    name   = "name"
    values = ["cp_nat_image-*"]
  }

  most_recent = true
}

# DNS filter
# hosted DNS network
data "aws_route53_zone" "my_domain" {
  name         = "thegaijin.xyz."
  private_zone = false
}
