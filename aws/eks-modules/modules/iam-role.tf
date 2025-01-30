
#This is a role  aws where interactive with the resource on behalf of the user
resource "aws_iam_role" "eks-iam-role" {
  name = "eks-iam-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
  
}

EOF
}


#This policy is used to attach the role to the eks_iam-role
resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role = aws_iam_role.eks-iam-role.name
  
}
#This is a role where aws interactive with the resource on behalf of the user
resource "aws_iam_role" "eks_node_policy" {
    name = "eks_node_policy"
    assume_role_policy = <<EOF
    {
    "Version": "2012-10-17",
    "Statement": [
        {
        "Effect": "Allow",
        "Principal": {
            "Service": "ec2.amazonaws.com"
        },
        "Action": "sts:AssumeRole"
        }
    ]
  
}

EOF
}

#This policy is used to attach to the role  eks_node_policy
#This policy allows Amazon EKS worker nodes to connect to Amazon EKS Clusters.
resource "aws_iam_role_policy_attachment" "eks_node_policy" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
    role = aws_iam_role.eks_node_policy.name
}

#This policy is used to attach to the role  eks_node_policy
#This policy allows Amazon Elastic Container Service for Kubernetes to create and manage the necessary resources to operate EKS Clusters.
resource "aws_iam_role_policy_attachment" "eks_service_policy" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
    role = aws_iam_role.eks_node_policy.name
  
}

#This policy is used to attach to the role  eks_node_policy
#This policy is used for managing the network in worker nodes
#These policies can be used to control incoming and outgoing traffic to and from the worker nodes.
resource "aws_iam_role_policy_attachment" "eks_cni_policy" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
    role = aws_iam_role.eks_node_policy.name
  
}

#This policy is used to attach to the role  eks_node_policy
#This policy is used for accessing ECR
resource "aws_iam_role_policy_attachment" "eks_ecr_policy" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
    role = aws_iam_role.eks_node_policy.name
  
}


resource "aws_iam_role_policy_attachment" "eks_ebs" {
    policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
    role = aws_iam_role.eks_node_policy.name
  
}




