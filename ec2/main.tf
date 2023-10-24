terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-2"
}


resource "aws_instance" "vm_web" {
  ami           = "ami-0e832ed7606840c66"
  instance_type = "t2.micro"
#  subnet_id =  data.aws_subnets.subs_eks.ids[0]
#  subnet_id =  "subnet-062d5a9842414e733" 
  subnet_id = data.aws_subnet.subs_public.id
    
  iam_instance_profile = data.aws_iam_instance_profile.ec2_iam.name 
  key_name = "ec2_key"
  vpc_security_group_ids = [data.aws_security_group.ssh_group.id]
  tags = {
    "Name" = "server for web"
    "Env" = "dev"
    "kubernetes.io/cluster/my_eks" = "owned"
  }
}
resource "aws_eip" "lb" {
  instance = aws_instance.vm_web.id
  domain   = "vpc"
}
resource "aws_key_pair" "ec2_key" {
  key_name   = "ec2_key"
  public_key = file("~/.ssh/id_rsa.pub")
}
