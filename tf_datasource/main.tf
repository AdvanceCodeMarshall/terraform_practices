provider "aws" {
    region = var.region
    profile = "aws-user"
}

data "aws_subnet" "subnet" {
  id = "subnet-07c5e47bf6062f552"
}
resource "aws_network_interface" "interface" {
  subnet_id       = data.aws_subnet.subnet.id
  private_ips     = ["172.16.1.100"]
}

resource "aws_instance" "ec2instance" {
  ami           = "ami-0f5ee92e2d63afc18" # ap-south-1
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.interface.id
    device_index         = 0

  }
  tags = {
    Name = "ec2-demo"
  }
}

variable "region" {
  type = string
  description = "location"
  default = "ap-south-1"
}