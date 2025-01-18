module "eks-cluster" {
    source = "./modules"
    cluster_name = "demo-eks-cluster"
    cluster_version = "1.30"
    eks_node_instance_type = ["t2.large"]
    region = "ap-south-1"
    vpc_name = "eks-vpc"
    availability_zone = ["ap-south-1a", "ap-south-1b"]
    public_subnet = ["ap-south-1a", "ap-south-1b"]
    private_subnet = ["ap-south-1a", "ap-south-1b"]
    vpc_cidr_block = "10.0.0.0/16"
    nat_gateway_name = "eks-nat-gateway"
    internet_gateway_name = "eks-ig"
    ami_type = "AL2_x86_64"

}