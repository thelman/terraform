#resource "aws_eks_node_group" "example" {
#  cluster_name    = aws_eks_cluster.my_eks.name
#  node_group_name = "nodes"
#  node_role_arn   = data.aws_iam_role.role_node.arn
#  subnet_ids      = data.aws_subnets.subs_eks.ids

#  scaling_config {
#    desired_size = 1
#    max_size     = 2
#    min_size     = 1
#  }

#  update_config {
#    max_unavailable = 1
#  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
#  depends_on = [
#    aws_iam_role_policy_attachment.example-AmazonEKSWorkerNodePolicy,
#    aws_iam_role_policy_attachment.example-AmazonEKS_CNI_Policy,
#    aws_iam_role_policy_attachment.example-AmazonEC2ContainerRegistryReadOnly,
#  ]
#}