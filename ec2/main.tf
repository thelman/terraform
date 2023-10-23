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
  region = "us-east-1"
}


resource "aws_instance" "vm-web" {
  ami           = "ami-026ebd4cfe2c043b2"
  instance_type = "t2.micro"
  subnet_id =  data.aws_subnets.selected.id
  

  tags = {
    Name = "server for web"
    Env = "dev"
    kubernetes_io_cluster_my-eks = "owned"
  }
}