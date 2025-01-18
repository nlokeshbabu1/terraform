
#This is a role policy attachment where aws interactive with the resource on behalf of the user
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


#This policy is used to attach the policy to the eks_cluster_policy
resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role = aws_iam_role.eks-iam-role.name
  
}
#This is a role policy attachment where aws interactive with the resource on behalf of the user
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

#This policy is used to attach the policy to the eks_worker_node_policy
resource "aws_iam_role_policy_attachment" "eks_node_policy" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
    role = aws_iam_role.eks_node_policy.name
}

resource "aws_iam_role_policy_attachment" "eks_service_policy" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
    role = aws_iam_role.eks_node_policy.name
  
}


#This policy is used for managing the network in worker nodes
resource "aws_iam_role_policy_attachment" "eks_cni_policy" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
    role = aws_iam_role.eks_node_policy.name
  
}
#This policy is used for accessing ECR
resource "aws_iam_role_policy_attachment" "eks_ecr_policy" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
    role = aws_iam_role.eks_node_policy.name
  
}


resource "aws_iam_role_policy_attachment" "eks_vpc_policy" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonVPCFullAccess"
    role = aws_iam_role.eks_node_policy.name
  
}

