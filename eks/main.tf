resource "aws_eks_cluster" "my_eks" {
  name     = "my_eks"
  role_arn = data.aws_iam_role.role.arn
  vpc_config {
    subnet_ids = data.aws_subnets.subs_eks.ids
    endpoint_private_access = true 
    endpoint_public_access = true
    security_group_ids = [data.aws_security_group.ssh_group.id]
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
#  depends_on = [
 #   aws_iam_role_policy_attachment.example-AmazonEKSClusterPolicy,
  #  aws_iam_role_policy_attachment.example-AmazonEKSVPCResourceController,
 # ]
}

output "endpoint" {
  value = aws_eks_cluster.my_eks.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.my_eks.certificate_authority[0].data
}
provider "aws" {
  region = "us-east-2"
}