resource "aws_eks_addon" "eks_addon_vpc_cni" {
  depends_on = [ aws_eks_cluster.eks-cluster ]
  cluster_name = var.cluster_name
  addon_name = "vpc-cni"
  addon_version = "1.19.0-eksbuild.1"
  service_account_role_arn = aws_iam_role.eks-iam-role.arn
  tags = {
    Name = "eks_addon"
  }
  
}

resource "aws_eks_addon" "eks_addon_kube_proxy" {
  depends_on = [ aws_eks_cluster.eks-cluster ]
  cluster_name = var.cluster_name
  addon_name = "kube-proxy"
  addon_version = "1.30.7-eksbuild.2"
  service_account_role_arn = aws_iam_role.eks-iam-role.arn
  tags = {
    Name = "eks_addon"
  }
  
}

resource "aws_eks_addon" "eks_addon_core_dns" {
  depends_on = [ aws_eks_cluster.eks-cluster ]
  cluster_name = var.cluster_name
  addon_name = "coredns"
  addon_version = "v1.11.1-eksbuild.9"
  service_account_role_arn = aws_iam_role.eks-iam-role.arn
  tags = {
    Name = "eks_addon"
  }
  
}