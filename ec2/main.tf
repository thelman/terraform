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


resource "aws_instance" "vm-web" {
  ami           = "ami-02b8534ff4b424939"
  instance_type = "t2.micro"
  subnet_id = "subnet-0e73c01a38f5d9bab"
  private_ip = "10.1.4.5"

  tags = {
    Name = "server for web"
    Env = "dev"
  }
}