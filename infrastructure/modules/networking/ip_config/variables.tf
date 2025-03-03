variable "rg_name" {
  type = string

}
variable "location" {
  type = string

}
variable "vnet_name" {
  type = string

}
variable "nic_name" {
  type = string

}
variable "create_subnet" {
  type = bool
}

variable "subnet_address_prefixes" {
  type = list(string)
}
variable "vm_name" {
  type = string

}