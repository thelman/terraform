data "aws_vpc" "selected" {
  tags = {
    Name = "main"
  }
}

data "aws_subnets" "selected" {
  filter {
    name   = "tag:Name"
    values = ["private"] # insert value here
  }
}
