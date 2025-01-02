output "vpc_id" {
  value = "VPC created with ID: ${module.vpc.vpc_id}"
}

output "publicsubnet01_id" {
  value = "Subnet created with ID: ${module.public-subnet01.subnet_id}"
}

output "publicsubnet02_id" {
  value = "Subnet created with ID: ${module.public-subnet02.subnet_id}"
}

output "privatesubnet01_id" {
  value = "Subnet created with ID: ${module.private-subnet01.subnet_id}"
}

output "privatesubnet02_id" {
  value = "Subnet created with ID: ${module.private-subnet02.subnet_id}"
}

output "nat01_id" {
  value = "NAT gateway created with ID: ${module.nat01.nat_id}"
}

output "nat02_id" {
  value = "NAT gateway created with ID: ${module.nat02.nat_id}"
}

output "public_rtb" {
  value = "RTB created with ID: ${module.public-rtb.rtb_id}"
}

output "private-rtb01" {
  value = "RTB created with ID: ${module.private-rtb01.rtb_id}"
}

output "private-rtb02" {
  value = "RTB created with ID: ${module.private-rtb02.rtb_id}"
}