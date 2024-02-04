### This includes internet_gateway, elastic_ips, natgateways, route_tables and routetable_association

resource "aws_internet_gateway" "demoigw" {
    vpc_id = var.vpc_id
}

resource "aws_route_table" "route_table1" {
    vpc_id = var.vpc_id

    route {
        cidr_block ="0.0.0.0/0"
        gateway_id = var.igw_id 
    }
  
}

resource "aws_route_table_association" "table_association1" {
    route_table_id = aws_route_table.route_table1.id
    subnet_id = [var.pub_subnet_id1, var.pub_subnet_id2]
  
}

resource "aws_eip" "elastic_ip1" {
  
}

resource "aws_nat_gateway" "nat1" {
    subnet_id = [var.subnet_id_1,  var.subnet_id_3]
    depends_on = [ aws_eip.elastic_ip1 ]
    allocation_id = aws_eip.elastic_ip1.id
}

resource "aws_eip" "elastic_ip2" {
  
}

resource "aws_nat_gateway" "nat2" {
    subnet_id = [var.subnet_id_2,  var.subnet_id_4]
    depends_on = [ aws_eip.elastic_ip2 ]
    allocation_id = aws_eip.elastic_ip2.id
}

resource "aws_route_table" "route_table2" {
    vpc_id = var.vpc_id
    depends_on = [ aws_nat_gateway.nat1, aws_nat_gateway.nat2 ]

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = [var.natgateway_id1, var.natgateway_id2]
    }  
}

resource "aws_route_table_association" "table_association2" {
    route_table_id = aws_route_table.route_table1.id
    subnet_id = [var.pri_subnet_id1, var.pri_subnet_id2, var.pri_subnet_id3, var.pri_subnet_id4]
  
}