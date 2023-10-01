#----------------SUBNET--------------------
resource "aws_subnet" "rubex_subnet" {
    vpc_id     = var.aws_vpc_id
    cidr_block = var.aws_subnet_cidr
    availability_zone = var.aws_subnet_availability_zone
    tags = var.aws_subnet_tag
}