resource "aws_route_table_association" "rubex_route_table_association" {
  subnet_id      = var.aws_subnet_id
  route_table_id = var.aws_route_table_id
}
