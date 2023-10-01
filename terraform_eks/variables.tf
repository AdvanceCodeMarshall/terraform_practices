#-------PROVIDER-------------
variable "region" {}
variable "access_key" {}
variable "secret_key" {}

#-------VPC-------------
variable "rubex_vpc_config" {}
#-------SUBENT_VARIABLE-------------
variable "rubex_subnet_config" {}
#-------INTERNET_GATEWAY_VARIABLE-------------
variable "rubex_internet_gateway_config" {}
#-------ELASTIC_IP_VARIABLE-------------
variable "rubex_elastic_ip_config" {}
#-------NAT_GATEWAY_VARIABLE-------------
variable "rubex_nat_gateway_config" {}
#-------ROUTE_TABLE_VARIABLE-------------
variable "rubex_route_table_config" {}
#-------ROUTE_TABLE_ASSOCIATION_VARIABLE-------------
variable "rubex_route_table_association_config" {}
#-------EKS_VARIABLE-------------------------------------
variable "rubex_eks_cluster_config" {}
#-------EKS_NODE_GROUP_VARIABLE-------------------------------------
variable "rubex_eks_node_group_config" {}