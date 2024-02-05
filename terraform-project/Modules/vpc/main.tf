provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "MyVPC" {
  cidr_block = var.cidr_block_vpc
  
  
}

resource "aws_subnet" "PublicSubnet1" {
  cidr_block = var.cidr_block_PublicSubnet1
  vpc_id = aws_vpc.MyVPC.id
  availability_zone = var.availability_zone1
  map_public_ip_on_launch = true
  
}

resource "aws_subnet" "PublicSubnet2" {
  cidr_block = var.cidr_block_PublicSubnet2
  vpc_id = aws_vpc.MyVPC.id
  availability_zone = var.availability_zone2
  map_public_ip_on_launch = true
  
}

resource "aws_subnet" "PrivateSubnet1" {
  cidr_block = var.cidr_block_PrivateSubnet1
  vpc_id = aws_vpc.MyVPC.id
  availability_zone = var.availability_zone1
  map_public_ip_on_launch = false
  
}

resource "aws_subnet" "PrivateSubnet2" {
  cidr_block = var.cidr_block_PrivateSubnet2
  vpc_id = aws_vpc.MyVPC.id
  availability_zone = var.availability_zone2
  map_public_ip_on_launch = false
  
}

resource "aws_subnet" "PrivateSubnet3" {
  cidr_block = var.cidr_block_PrivateSubnet3
  vpc_id = aws_vpc.MyVPC.id
  availability_zone = var.availability_zone1
  map_public_ip_on_launch = false
  
}

resource "aws_subnet" "PrivateSubnet4" {
  cidr_block = var.cidr_block_PrivateSubnet4
  vpc_id = aws_vpc.MyVPC.id
  availability_zone = var.availability_zone2
  map_public_ip_on_launch = false
  
}

