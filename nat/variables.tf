variable "domain" {
    type = string
}
variable "eiptags" {
    type = map(string)
}
variable "allocation_id" {
    type = string
}
variable "subnet_id" {
    type = string
}
variable "connectivity_type" {
    type = string
}
variable "nattags" {
    type = map(string)
}