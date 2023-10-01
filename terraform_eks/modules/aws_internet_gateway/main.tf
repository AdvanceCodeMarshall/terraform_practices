#----------------INTERNET_GATEWAY--------------------
resource "aws_internet_gateway" "rubex_internet_gateway" {
    vpc_id = var.aws_vpc_id
    tags = var.aws_internet_gateway_tag
}