resource "aws_route_table" "rtb" {
    vpc_id = var.vpc_id
    tags = var.tags

    dynamic "route" {
        for_each = var.routes
        content {
            cidr_block = route.value.cidr_block
            ipv6_cidr_block = route.value.ipv6_cidr_block
            gateway_id = route.value.gateway_id
            nat_gateway_id = route.value.nat_gateway_id
        }
    }
}

resource "aws_route_table_association" "rtb-association" {
    for_each = var.subnet_ids
    subnet_id = each.value
    route_table_id = aws_route_table.rtb.id
}