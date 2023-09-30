variable "vpc_id" {
    type = string
}

variable "security_group_tag" {
    type = map(any)
    description = "security group tag"
    default = {
      "Name" = "allow_tls"
    }
}
