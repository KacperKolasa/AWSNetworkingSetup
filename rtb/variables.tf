variable "routes" {
    type = list(object({
        cidr_block = optional(string)
        ipv6_cidr_block = optional(string)
        gateway_id = optional(string)
        nat_gateway_id = optional(string)
    }))
    default = []
}
variable "vpc_id" {
    type = string
}
variable "tags" {
    type = map(string)
}
variable "subnet_ids" {
    type = map(string)
    default = {}
}