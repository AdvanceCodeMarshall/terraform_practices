provider "aws" {
    region = var.region
    profile = "aws-user"
}

resource "aws_vpc" "main" {
    cidr_block = "172.16.0.0/16"
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "172.16.1.0/24"

  tags = {
    Name = "Main"
  }
}

resource "aws_network_interface" "interface" {
  subnet_id       = aws_subnet.main.id
  private_ips     = ["172.16.1.100"]
}

resource "aws_instance" "ec2instance" {
  ami           = "ami-0f5ee92e2d63afc18" # ap-south-1
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.interface.id
    device_index         = 0
  }
}

variable "region" {
  type = string
  description = "location"
  default = "ap-south-1"
}