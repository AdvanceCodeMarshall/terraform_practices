
#--------VPC--------------
module "vpc" {
    source = "./modules/vpc"
    vpc_cidr = var.vpc_cidr
    vpc_tag = var.vpc_tag
}
#--------SUBNET--------------
module "subnet" {
    source = "./modules/subnet"
    vpc_id = module.vpc.vpc_id
    subnet_cidr = var.subnet_cidr
    subnet_availability_zone = var.subnet_availability_zone
    subnet_tag = var.subnet_tag
}
#--------SECURITY_GROUP--------------
module "security_group" {
    source = "./modules/security_group"
    vpc_id = module.vpc.vpc_id
    security_group_tag = var.security_group_tag
}
#--------NETWORK_INTERFACE--------------
module "network_interface" {
    source = "./modules/network_interface"
    for_each = var.ec2_config
    subnet_id = module.subnet.subnet_id
    private_ips = each.value.private_ips
    network_interface_tag = each.value.network_interface_tag
}
#--------EC2--------------
module "ec2" {
    source = "./modules/ec2"
    depends_on = [ module.network_interface ]
    for_each = var.ec2_config
    aws_ec2_instance_name = each.value.aws_ec2_instance_name
    aws_ec2_instance_type = each.value.aws_ec2_instance_type
    aws_ec2_instance_ami = each.value.aws_ec2_instance_ami
    aws_network_interface_id = module.network_interface[each.key].network_interface_id
}









