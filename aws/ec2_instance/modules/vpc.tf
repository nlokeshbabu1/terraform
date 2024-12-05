resource "aws_vpc" "pratice_vpc" {
    cidr_block = var.vpc_cidr
    enable_dns_hostnames = "true"
    enable_dns_support = "true"
  
}

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.pratice_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-south-1a"
  map_public_ip_on_launch = "true"
}



