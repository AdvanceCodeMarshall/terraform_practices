provider "aws" {
    region = var.region
    profile = "aws-user"
}

# FOR EACH - Map of String

# resource "aws_vpc" "main" {
#     for_each = var.vpc_cidr
#     cidr_block = each.value
#     tags = {
#       "Name" = each.key
#     }
# }

# FOR EACH - Map of Object

resource "aws_vpc" "main" {
    # for_each = var.vpcs
    # cidr_block = each.value.cidr
    # instance_tenancy = each.value.instance_tenancy
    # tags = each.value["tags"]

    cidr_block = "172.16.0.0/16"
}

resource "aws_security_group" "allow_tls" {
    name        = "allow_tls"
    description = "Allow TLS inbound traffic"
    vpc_id      = aws_vpc.main.id


    dynamic "ingress" {
        for_each = var.aws_security_group
        content {
        description      = ingress.value.description
        from_port        = ingress.value.from_port
        to_port          = ingress.value.to_port
        protocol         = ingress.value.protocol
        cidr_blocks      = ingress.value.cidr_blocks
        }
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    tags = {
        Name = "allow_tls"
    }
}