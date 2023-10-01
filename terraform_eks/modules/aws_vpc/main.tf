#----------------VPC--------------------

resource "aws_vpc" "rubex_vpc" {
  cidr_block       = var.aws_vpc_cidr
  tags             = var.aws_vpc_tag
}