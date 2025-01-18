resource "aws_eks_cluster" "eks-cluster" {
    name = var.cluster_name
    role_arn = aws_iam_role.eks-iam-role.arn
    version = var.cluster_version

    access_config {
        authentication_mode = "API_AND_CONFIG_MAP"
        bootstrap_cluster_creator_admin_permissions = true
        
    }

    vpc_config {
        subnet_ids = [aws_subnet.eks-private_subnet[0].id, aws_subnet.eks-private_subnet[1].id]
        security_group_ids = [aws_security_group.eks-cluster.id]
        endpoint_private_access = true
        endpoint_public_access = false
        
    }

    depends_on = [ aws_iam_role_policy_attachment.eks_cluster_policy ] 
}


resource "aws_eks_node_group" "aws_eks_node_group" {
    cluster_name = aws_eks_cluster.eks-cluster.name
    node_group_name = "eks-node-group"
    node_role_arn = aws_iam_role.eks_node_policy.arn
    subnet_ids = [aws_subnet.eks-private_subnet[0].id, aws_subnet.eks-private_subnet[1].id]
    instance_types = var.eks_node_instance_type
    ami_type = var.ami_type
    scaling_config {
        desired_size = 2
        max_size = 2
        min_size = 2
    }
    capacity_type = "ON_DEMAND"
    tags = {
        Name = "eks-node-group"
    }

    depends_on = [ 
        aws_iam_role_policy_attachment.eks_service_policy,
        aws_iam_role_policy_attachment.eks_cni_policy,
        aws_iam_role_policy_attachment.eks_node_policy,
        aws_iam_role_policy_attachment.eks_ecr_policy
     ]
  
}