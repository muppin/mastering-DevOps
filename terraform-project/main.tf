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