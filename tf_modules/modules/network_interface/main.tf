#-----------------------------------------AWS_NETWORK_INTERFACE ATTACHED TO AWS_INSTANCE------------------------------------------
resource "aws_network_interface" "interface" {
    subnet_id = var.subnet_id
    private_ips = var.private_ips
    tags = var.network_interface_tag
}
