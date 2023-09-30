variable "region" {
  type = string
  description = "location"
  default = "ap-south-1"
}


# variable "vpc_cidr" {
#     type = map(string)
#     default = {
#         "dev" = "172.16.0.0/16",
#         "prod" = "172.16.0.0/24"
#     }
# }

# variable "vpcs" {
#     type = map(object({
#       cidr = string
#       instance_tenancy = string
#       tags = map(string)
#     }))
#     default = {
#       "1" = {
#         cidr = "172.16.0.0/16"
#         instance_tenancy = "default"
#         tags = {
#             "Name" = "DEV"
#         }
#       }
#       "2" = {
#         cidr = "172.16.0.0/24"
#         instance_tenancy = "default"
#         tags = {
#             "Name" = "PROD"
#             "Environment" = "2"
#         }
#       }
#     }
# }

variable "aws_security_group" {
    type = map(object({
      description      = string
      from_port        = number
      to_port          = number
      protocol         = string
      cidr_blocks      = list(string)
    }))
    default = {
      "ss" = {
        description = "TLS Rule 1"
        from_port        = 80
        to_port          = 80
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
      }
      "ts" = {
        description = "TLS Rule 2"
        from_port        = 443
        to_port          = 443
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]    
      }
    }
}
