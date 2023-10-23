data "aws_vpc" "vpc_eks" {
  tags = {
    Name = "Project VPC"
  }
}

data "aws_subnets" "subs_eks" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc_eks.id]
  }
}
data "aws_iam_role" "role" {
  name = "my_eks_role"
}

data "aws_iam_role" "role_node" {
  name = "my_nodes_iam"
}

