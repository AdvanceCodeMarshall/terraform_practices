variable "vpc_id" {
    type = string
}

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