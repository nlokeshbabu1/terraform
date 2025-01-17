resource "aws_eks_cluster" "eks-cluster" {
    name = var.cluster_name
    role_arn = aws_iam_role.eks-iam-role.arn
    version = var.cluster_version

    access_config {
        authentication_mode = "API"
        
    }

    vpc_config {
        subnet_ids = [aws_subnet.eks-private_subnet[0].id, aws_subnet.eks-private_subnet[1].id]
        security_group_ids = [aws_security_group.eks-cluster.id]
        
    }
}


resource "aws_eks_node_group" "aws_eks_node_group" {
    cluster_name = aws_eks_cluster.eks-cluster.name
    node_group_name = "eks-node-group"
    node_role_arn = aws_iam_role.eks_node_policy.arn
    subnet_ids = [aws_subnet.eks-private_subnet[0].id, aws_subnet.eks-private_subnet[1].id]
    instance_types = var.eks_node_instance_type
    scaling_config {
        desired_size = 2
        max_size = 2
        min_size = 2
    }
    capacity_type = "ON_DEMAND"
    tags = {
        Name = "eks-node-group"
    }
  
}