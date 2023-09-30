#-----------------------------------------AWS_INSTANCE------------------------------------
resource "aws_instance" "ec2instance" {
    ami           = var.aws_ec2_instance_ami # us-east-2
    instance_type = var.aws_ec2_instance_type

    network_interface {
        network_interface_id = var.aws_network_interface_id
        device_index         = 0
    }
    tags = var.aws_ec2_instance_name
}