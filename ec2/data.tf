data "aws_vpc" "vpc_eks" {
  tags = {
    Name = "Project VPC"
  }
}

#data "aws_subnets" "subs_eks" {
 # filter {
 #   name   = "vpc-id"
 #   values = [data.aws_vpc.vpc_eks.id]
 # }
#}

data "aws_subnet" "subs_priv"{
  filter{
    name = "tag:Name"
    values = ["Private Subnet 1"]
  }
}
data "aws_subnet" "subs_public"{
  filter{
    name = "tag:Name"
    values = ["Public Subnet 1"]
  }
}
data "aws_iam_instance_profile" "ec2_iam" {
  name = "ec2_iam"
}
data "aws_security_group" "ssh_group" {
  name = "ssh_group"
}