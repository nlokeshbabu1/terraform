output "public_ip_of_db" {
    description = "this is the public IP"
    value = aws_instance.db.public_ip
}


output "private_ip_of_db" {
    description = "this is the private IP"
    value = aws_instance.db.private_ip
}


output "public_ip_of_web-server" {
    description = "this is the public IP"
    value = aws_instance.web-server.public_ip
}

output "private_ip_of_web-server" {
    description = "this is private IP"
    value = aws_instance.web-server.private_ip
}
