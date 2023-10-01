#---------------NAT_GATEWAY--------------------
resource "aws_nat_gateway" "rubex_nat_gateway" {
  allocation_id = var.aws_elastic_IP_id
  subnet_id     = var.aws_subnet_id
  tags          = var.aws_nat_gateway_tag
}

