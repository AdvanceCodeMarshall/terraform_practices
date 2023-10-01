#-----------ELASTIC_IP_OUTPUT-----------------
output "aws_elastic_ip_id" {
    value = aws_eip.rubex_elastic_ip.id
}