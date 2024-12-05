resource "aws_instance" "my-ec2" {
    ami = var.ami_id
    instance_type = var.instance_type
    subnet_id = aws_subnet.public_subnet.id
    security_groups = [aws_security_group.sg_pratice.id]

    tags = {
        Name = var.instance_name
    }

    associate_public_ip_address = true
}


