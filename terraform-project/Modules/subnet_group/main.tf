resource "aws_db_subnet_group" "dbdemo" {
    subnet_ids = [var.subnet_id5, var.subnet_id6]
    name = "dbdemo"
}