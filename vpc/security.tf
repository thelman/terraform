resource "aws_security_group" "ingress_ssh" {
    name = "ssh_group"
    vpc_id = aws_vpc.main.id
    ingress {
     cidr_blocks = ["0.0.0.0/0"]
     from_port = 22
     to_port = 22
     protocol = "tcp"
  }// Terraform removes the default rule
    egress {
     from_port = 0
     to_port = 0
     protocol = "-1"
     cidr_blocks = ["0.0.0.0/0"]
 }
 }

resource "aws_security_group" "security_test" {
    name = "security_test"
    vpc_id = aws_vpc.main.id
    ingress {
     cidr_blocks = ["0.0.0.0/0"]
     from_port = 0
     to_port = 0
     protocol = "-1"
  }// Terraform removes the default rule
    egress {
     from_port = 0
     to_port = 0
     protocol = "-1"
     cidr_blocks = ["0.0.0.0/0"]
 }
 }