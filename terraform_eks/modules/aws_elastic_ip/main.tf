#-----------ELASTIC_IP-----------------
resource "aws_eip" "rubex_elastic_ip" {
  tags = var.aws_elastic_ip_tag
}