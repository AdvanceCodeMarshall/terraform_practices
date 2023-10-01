#-------------EKS_OUTPUT--------------
output "eks_cluster" {
  value = aws_eks_cluster.rubex_eks_cluster.name
}