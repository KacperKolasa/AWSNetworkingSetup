variable "cidr_block" {
    type = string
}
variable "instance_tenancy" {
    default = "default"
}
variable "enable_dns_support" {
    default = true
}
variable "enable_dns_hostnames" {
    default = true
}
variable "tags" {
    type = map(string)
    default = {
        Name = "main-vpc"
    }
}