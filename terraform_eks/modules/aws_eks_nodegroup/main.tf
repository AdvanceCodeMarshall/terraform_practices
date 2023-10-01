#-------------EKS_NODE_GROUP-----------------
resource "aws_eks_node_group" "rubex_aws_eks_node_group" {
  cluster_name    = var.aws_eks_cluster_name
  node_group_name = var.aws_eks_cluster_node_group_name
  node_role_arn   = aws_iam_role.rubex_aws_iam_role_eks_node_group_cluster.arn
  subnet_ids      = var.aws_subnet_ids

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

  instance_types = ["t3.medium"]

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.example-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.example-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.example-AmazonEC2ContainerRegistryReadOnly,
  ]
  tags = var.aws_eks_node_group_tag
}

resource "aws_iam_role" "rubex_aws_iam_role_eks_node_group_cluster" {
  name = var.aws_eks_node_group_iam_role

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "example-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.rubex_aws_iam_role_eks_node_group_cluster.name
}

resource "aws_iam_role_policy_attachment" "example-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.rubex_aws_iam_role_eks_node_group_cluster.name
}

resource "aws_iam_role_policy_attachment" "example-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.rubex_aws_iam_role_eks_node_group_cluster.name
}

