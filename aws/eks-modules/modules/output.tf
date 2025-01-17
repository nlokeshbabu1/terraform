output "eks-cluster_name" {
  value = aws_eks_cluster.eks-cluster.name
  
}

output "eks-cluster_version" {
  value = aws_eks_cluster.eks-cluster.version
  
}


output "vpc_cidr_block" {
  value = var.vpc_cidr_block
  
}

