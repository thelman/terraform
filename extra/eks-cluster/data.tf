data "aws_subnets" "eks_subnet" {
  filter {
    name   = "vpc-id"
    values = [aws_vpc.eks.id]
  }
}
data "aws_subnets" "subs_priv"{
  filter{
    name = "tag:Name"
    values = ["eks-private-subnet"]
  }
}