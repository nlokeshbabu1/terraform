resource "aws_security_group" "sg_pratice" {
    name = var.sg_name
    description = "Allow ssh to the ec2"
    vpc_id = aws_vpc.pratice_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


 