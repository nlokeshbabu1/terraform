variable "region" {
  description = "AWS region"

}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  
}

variable "cluster_version" {
  description = "Version of the EKS cluster"  
  
}

variable "eks_node_instance_type" {
  description = "Instance type for the EKS worker nodes"  
  
}


variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  
}

variable "availability_zone" {
  description = "Availability zone for the subnet in public subnet"
  type        = list(string)
  
}

variable "vpc_name" {
  description = "Name of the VPC"
  
}

variable "internet_gateway_name" {
  description = "Name of the internet gateway"
  
}

variable "public_subnet" {
  description = "Name of the public subnet-1"
  
}


variable "private_subnet" {
  description = "Name of the private subnet-1"
  
}



variable "nat_gateway_name" {
  description = "Name of the NAT gateway"
  
}





