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

variable "security_rules" {
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))

}
variable "vm_name" {
  type = string

}