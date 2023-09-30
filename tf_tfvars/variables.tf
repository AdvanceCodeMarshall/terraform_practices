variable "region" {
  type = string
  description = "location"
  default = "ap-south-1"
}
variable "aws_subnet_id" {
  type = string
  description = "instance type"
  default = "subnet-07c5e47bf6062f552"
}
variable "ami" {
  type = string
  description = "ami"
  default = "ami-0f5ee92e2d63afc18"
}
variable "aws_ec2_instance_name" {
  type = string
  description = "ec2 instance name"
  default = "ec2-demo"
}
variable "aws_ec2_instance_type" {
  type = string
  description = "instance type"
  default = "t2.micro"
}

