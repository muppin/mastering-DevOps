### This includes internet_gateway, elastic_ips, natgateways, route_tables and routetable_association

resource "aws_internet_gateway" "demoigw" {
    vpc_id = var.vpc_id
}

resource "aws_route_table" "route_table1" {
    vpc_id = var.vpc_id

    route {
        cidr_block ="0.0.0.0/0"
        gateway_id = aws_internet_gateway.demoigw.id 
    }
  
}

resource "aws_route_table_association" "table_association1" {
    route_table_id = aws_route_table.route_table1.id
    subnet_id = var.subnet_id1
  
}

resource "aws_route_table_association" "table_association2" {
    route_table_id = aws_route_table.route_table1.id
    subnet_id = var.subnet_id2
  
}

resource "aws_eip" "elastic_ip1" {
    domain = "vpc"
    depends_on = [ aws_internet_gateway.demoigw ]
}

resource "aws_nat_gateway" "nat1" {
    subnet_id = var.subnet_id1
    depends_on = [ aws_eip.elastic_ip1 ]
    allocation_id = aws_eip.elastic_ip1.id
}

resource "aws_eip" "elastic_ip2" {
    domain = "vpc"
    depends_on = [ aws_internet_gateway.demoigw ]
}

resource "aws_nat_gateway" "nat2" {
    subnet_id = var.subnet_id2
    depends_on = [ aws_eip.elastic_ip2 ]
    allocation_id = aws_eip.elastic_ip2.id
}

resource "aws_route_table" "route_table3" {
    vpc_id = var.vpc_id
    depends_on = [aws_nat_gateway.nat1]

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.nat1.id
    }  
}

resource "aws_route_table_association" "table_association3" {
    route_table_id = aws_route_table.route_table3.id
    subnet_id = var.subnet_id3
  
}

resource "aws_route_table" "route_table4" {
    vpc_id = var.vpc_id
    depends_on = [aws_nat_gateway.nat2]

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.nat2.id
    }  
}



resource "aws_route_table_association" "table_association4" {
    route_table_id = aws_route_table.route_table4.id
    subnet_id = var.subnet_id4
  
}

resource "aws_route_table" "route_table5" {
    vpc_id = var.vpc_id
    depends_on = [aws_nat_gateway.nat1]

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.nat1.id
    }  
}

resource "aws_route_table_association" "table_association5" {
    route_table_id = aws_route_table.route_table5.id
    subnet_id = var.subnet_id5
  
}

resource "aws_route_table" "route_table6" {
    vpc_id = var.vpc_id
    depends_on = [aws_nat_gateway.nat2]

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.nat2.id
    }  
}

resource "aws_route_table_association" "table_association6" {
    route_table_id = aws_route_table.route_table6.id
    subnet_id = var.subnet_id6
  
}