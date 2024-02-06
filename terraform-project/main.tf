module "vpc" {
  source = "./Modules/vpc"
  cidr_block_vpc = var.cidr_block_vpc
  cidr_block_PublicSubnet1 = var.cidr_block_PublicSubnet1
  cidr_block_PublicSubnet2 = var.cidr_block_PublicSubnet2
  cidr_block_PrivateSubnet1 = var.cidr_block_PrivateSubnet1
  cidr_block_PrivateSubnet2 = var.cidr_block_PrivateSubnet2
  cidr_block_PrivateSubnet3 = var.cidr_block_PrivateSubnet3
  cidr_block_PrivateSubnet4 = var.cidr_block_PrivateSubnet4
  availability_zone1 = var.availability_zone1
  availability_zone2 = var.availability_zone2
}

module "route_tables" {
  source = "./Modules/route_tables"
  vpc_id = module.vpc.vpc_id
  subnet_id1 = module.vpc.subnet_id1
  subnet_id2 = module.vpc.subnet_id2
  subnet_id3 = module.vpc.subnet_id3
  subnet_id4 = module.vpc.subnet_id4
  subnet_id5 = module.vpc.subnet_id5
  subnet_id6 = module.vpc.subnet_id6
  
}