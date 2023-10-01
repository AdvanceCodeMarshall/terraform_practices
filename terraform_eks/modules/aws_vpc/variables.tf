#----------------VPC-VARIABLES--------------------
variable "aws_vpc_cidr" {
    type = string
    description = "aws vpc cidr"
    default = "10.0.0.0/16"
}

variable "aws_vpc_tag" {
    type = map(any)
    description = "aws vpc tag"
    default = {
      "Name" = "rubex_vpc"
    }
}