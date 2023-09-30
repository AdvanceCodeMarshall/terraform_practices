variable "subnet_id" {
    type = string
}

variable "network_interface_tag" {
    type = map(any)
    description = "network interface tags"
    default = {
      "Name" = "prod_network_interface"
    }
}

variable "private_ips" {
    type = list(string)
    default = [ "172.16.10.100" ]
}