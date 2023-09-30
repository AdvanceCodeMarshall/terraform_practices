provider "aws" {
  region = "ap-south-1"
  profile = "aws-user"
}

resource "aws_instance" "example" {
    ami = "ami-0f5ee92e2d63afc18"
    instance_type = "t2.micro"
    availability_zone = "ap-south-1a"
    lifecycle{
        ignore_changes = [ami]
    }
}