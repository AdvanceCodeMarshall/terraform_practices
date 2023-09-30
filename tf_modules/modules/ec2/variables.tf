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
variable "aws_network_interface_id" {
  type = string
}

variable "aws_ec2_instance_name" {
  type = map(any)
  description = "ec2 instance name"
  default = {
    "Name" = "PRODUCTION"
  }
}
