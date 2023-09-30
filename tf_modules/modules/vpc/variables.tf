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