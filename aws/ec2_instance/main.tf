module "EC2" {
    source = "./modules"
    instance_name = "practice"
    region = "ap-south-1"
    vpc_cidr = "10.0.0.0/16"
    instance_type = "t3.micro"
    ami_id = "ami-0614680123427b75e"
    sg_name = "pactice"
  
}