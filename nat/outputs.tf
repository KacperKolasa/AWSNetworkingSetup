output "eip_id" {
    value = aws_eip.eip.id
}

output "nat_id" {
    value = aws_nat_gateway.nat-gateway.id
}