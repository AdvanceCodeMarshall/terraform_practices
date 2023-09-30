provider "aws" {
    region = var.region
    profile = "aws-user"
}

data "aws_subnet" "subnet" {
  id = var.aws_subnet_id
}
resource "aws_network_interface" "interface" {
  subnet_id       = data.aws_subnet.subnet.id
  private_ips     = ["172.16.1.100"]
}

resource "aws_instance" "ec2instance" {
  ami           = var.ami # ap-south-1
  instance_type = var.aws_ec2_instance_type

  network_interface {
    network_interface_id = aws_network_interface.interface.id
    device_index         = 0

  }
  tags = {
    Name = var.aws_ec2_instance_name
  }
}

