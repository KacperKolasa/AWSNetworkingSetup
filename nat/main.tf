resource "aws_eip" "eip" {
    domain = var.domain
    tags = var.eiptags
}

resource "aws_nat_gateway" "nat-gateway" {
    allocation_id = var.allocation_id
    subnet_id = var.subnet_id
    connectivity_type = var.connectivity_type
    tags = var.nattags
}