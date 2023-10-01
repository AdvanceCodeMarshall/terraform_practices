#-------VPC-------------
module "rubex_vpc_module" {
    source = "./modules/aws_vpc"
    for_each = var.rubex_vpc_config
    aws_vpc_cidr = each.value.aws_vpc_cidr
    aws_vpc_tag = each.value.aws_vpc_tag
}
#-------SUBENT-------------
module "rubex_subnet_module" {
    source = "./modules/aws_subnet"
    for_each = var.rubex_subnet_config
    aws_vpc_id = module.rubex_vpc_module[each.value.aws_vpc_name].aws_vpc_id
    aws_subnet_cidr = each.value.aws_subnet_cidr
    aws_subnet_availability_zone = each.value.aws_subnet_availability_zone
    aws_subnet_tag = each.value.aws_subnet_tag
}
#-------INTERNET_GATEWAY-------------
module "rubex_internet_gateway_module" {
  source = "./modules/aws_internet_gateway"
  for_each = var.rubex_internet_gateway_config
  aws_vpc_id = module.rubex_vpc_module[each.value.aws_vpc_name].aws_vpc_id
  aws_internet_gateway_tag = each.value.aws_internet_gateway_tag

}
#-------ELASTIC_IP-------------
module "rubex_elastic_ip_module" {
  source = "./modules/aws_elastic_ip"
  for_each = var.rubex_elastic_ip_config
  aws_elastic_ip_tag = each.value.aws_elastic_ip_tag
}

#-------NAT_GATEWAY-------------
module "rubex_nat_gateway_module" {
  source = "./modules/aws_nat_gateway"
  for_each = var.rubex_nat_gateway_config
  aws_elastic_IP_id = module.rubex_elastic_ip_module[each.value.aws_elastic_ip_name].aws_elastic_ip_id
  aws_subnet_id = module.rubex_subnet_module[each.value.aws_subnet_name].aws_subnet_id
  aws_nat_gateway_tag = each.value.aws_nat_gateway_tag
}

#-------ROUTE_TABLE-------------
module "rubex_route_table_module" {
  source = "./modules/aws_route_table"
  for_each = var.rubex_route_table_config
  aws_vpc_id = module.rubex_vpc_module[each.value.aws_vpc_name].aws_vpc_id
  aws_internet_gateway_id = each.value.private == 0 ? module.rubex_internet_gateway_module[each.value.aws_gateway_name].aws_internet_gateway_id : module.rubex_nat_gateway_module[each.value.aws_gateway_name].aws_nat_gateway_id
  aws_route_table_tag = each.value.aws_route_table_tag
}
#-------ROUTE_TABLE_ASSOCIATION-------------
module "rubex_route_table_association_module" {
  source = "./modules/aws_route_table_association"
  for_each = var.rubex_route_table_association_config
  aws_subnet_id = module.rubex_subnet_module[each.value.aws_subnet_name].aws_subnet_id
  aws_route_table_id = module.rubex_route_table_module[each.value.aws_route_table_name].aws_route_table_id
}

#-------EKS-------------------------------------
module "rubex_eks_module" {
  source = "./modules/aws_eks"
  for_each = var.rubex_eks_cluster_config
  aws_eks_cluster_name = each.value.aws_eks_cluster_name
  aws_eks_cluster_subnet_ids = [module.rubex_subnet_module[each.value.rubex-public-subnet-us-east-1a].aws_subnet_id,module.rubex_subnet_module[each.value.rubex-public-subnet-us-east-1b].aws_subnet_id,module.rubex_subnet_module[each.value.rubex-private-subnet-us-east-1a].aws_subnet_id,module.rubex_subnet_module[each.value.rubex-private-subnet-us-east-1b].aws_subnet_id]
  aws_eks_cluster_tag = each.value.aws_eks_cluster_tag
}
#-------EKS_NODE_GROUP-------------------------------------
module "rubex_eks_node_group_module" {
  source = "./modules/aws_eks_nodegroup"
  for_each = var.rubex_eks_node_group_config
  aws_eks_cluster_node_group_name = each.value.aws_eks_cluster_node_group_name
  aws_eks_cluster_name = module.rubex_eks_module[each.value.aws_eks_cluster_name].eks_cluster
  aws_subnet_ids = [module.rubex_subnet_module[each.value.rubex-private-subnet-us-east-1a].aws_subnet_id,module.rubex_subnet_module[each.value.rubex-private-subnet-us-east-1b].aws_subnet_id]
  aws_eks_node_group_iam_role = each.value.aws_eks_node_group_iam_role
  aws_eks_node_group_tag = each.value.aws_eks_node_group_tag
}
