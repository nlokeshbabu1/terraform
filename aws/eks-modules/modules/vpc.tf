resource "aws_vpc" "eks-aws_vpc" {
    cidr_block = var.vpc_cidr_block
    enable_dns_support = true
    enable_dns_hostnames = true
    tags = {
        Name = var.vpc_name
    }
  
}



resource "aws_subnet" "eks-public" {
    count = 2
    vpc_id = aws_vpc.eks-aws_vpc.id
    cidr_block = cidrsubnet(aws_vpc.eks-aws_vpc.cidr_block, 8, count.index + 2)
    availability_zone = element(var.availability_zone, count.index)
    map_public_ip_on_launch = true
    tags = {
      Name = "eks-public-subnet-${count.index + 2}"
    }
  
}

resource "aws_eip" "eks-aws_eip" {
    domain = "vpc"
    tags = {
        Name = "eks-aws_eip"

    }
}

resource "aws_nat_gateway" "eks-aws_nat_gateway" {
    allocation_id = aws_eip.eks-aws_eip.id
    subnet_id = aws_subnet.eks-public[0].id
    tags = {
        Name = var.nat_gateway_name
    }
  
}

resource "aws_subnet" "eks-private_subnet" {
    count = 2
    vpc_id = aws_vpc.eks-aws_vpc.id
    availability_zone = element(var.availability_zone, count.index)
    cidr_block = cidrsubnet(aws_vpc.eks-aws_vpc.cidr_block, 8, count.index + 4 ) #example: vpc = 10.0.0.0/16, private subnet = 10.0.4.0/24 private subnet = 10.0.5.0/24
    tags = {
      Name = "eks-private-subnet-${count.index + 2}"
    }
  
}

resource "aws_internet_gateway" "eks-internet_gateway" {
    vpc_id = aws_vpc.eks-aws_vpc.id
    tags = {
        Name = var.internet_gateway_name
    }
  
}



resource "aws_route_table" "eks-public_route_table" {
    vpc_id = aws_vpc.eks-aws_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.eks-internet_gateway.id
  
    }
}


resource "aws_route_table_association" "eks-public_route_table_association" {
    count = length(aws_subnet.eks-public)
    subnet_id = aws_subnet.eks-public[count.index].id
    route_table_id = aws_route_table.eks-public_route_table.id

}

resource "aws_route_table" "eks-private_route_table" {
    vpc_id = aws_vpc.eks-aws_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.eks-aws_nat_gateway.id
            
  
    }
}

resource "aws_route_table_association" "eks-private_route_table_association" {
    count = length(aws_subnet.eks-private_subnet)
    subnet_id = aws_subnet.eks-private_subnet[count.index].id
    route_table_id = aws_route_table.eks-private_route_table.id
  
}


resource "aws_security_group" "eks-cluster" {
    vpc_id = aws_vpc.eks-aws_vpc.id
    name = "eks-cluster-sg"
    
  ingress {
    from_port = 443
    to_port = 443
    protocol = "TCP"
    cidr_blocks = ["10.0.0.0/16"]
    }
  
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    }
  }

  




output "vpc_id" {
    value = aws_vpc.eks-aws_vpc.id
}