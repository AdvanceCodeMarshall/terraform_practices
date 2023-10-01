resource "aws_route_table" "rubex_route_table" {
  vpc_id = var.aws_vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.aws_internet_gateway_id
  }

  tags = var.aws_route_table_tag
}