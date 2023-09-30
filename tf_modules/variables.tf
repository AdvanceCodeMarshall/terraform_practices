#-------PROVIDER-------------
variable "mumbai" {
  type = string
  description = "location"
  default = "ap-south-1"
}
#--------VPC--------------
variable "vpc_cidr" {
    type = string
    description = "vpc cidr"
    default = "172.16.0.0/16"
}
variable "vpc_tag" {
    type = map(any)
    description = "vpc tag"
    default = {
      "Name" = "prod_vpc"
    }
}
#--------SUBNET--------------
variable "subnet_cidr" {
    type = string
    default = "172.16.10.0/24"
}
variable "subnet_tag" {
    type = map(any)
    description = "subnet tag"
    default = {
      "Name" = "prod_subnet"
    }
}
variable "subnet_availability_zone" {
    type = string
    description = "subnet availability zone"
    default = "ap-south-1a"
}
#--------SECURITY_GROUP--------------
variable "security_group_tag" {
    type = map(any)
    description = "security group tag"
    default = {
      "Name" = "allow_tls"
    }
}
#--------NETWORK_INTERFACE--------------
variable "private_ips" {
    type = list(string)
    default = [ "172.16.10.100" ]
}
variable "network_interface_tag" {
    type = map(any)
    description = "network interface tags"
    default = {
      "Name" = "prod_network_interface"
    }
}
#--------EC2--------------
variable "aws_ec2_instance_ami" {
  type = string
  description = "ami"
  default = "ami-0f5ee92e2d63afc18"
}
variable "aws_ec2_instance_type" {
  type = string
  description = "instance type"
  default = "t2.micro"
}
variable "aws_ec2_instance_name" {
  type = map(any)
  description = "ec2 instance name"
  default = {
    "Name" = "PRODUCTION"
  }
}

variable "ec2_config" {
  type = map(any)
}

