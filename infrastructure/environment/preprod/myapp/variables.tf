variable "rg_name" {
  default = "terraformrg"
  type    = string

}
variable "location" {
  type = string

}
variable "vnet_name" {
  type = string

}
variable "create_subnet" {
  type = bool
}
variable "subnet_address_prefixes" {
  type    = list(string)
  default = ["10.0.2.0/24"] # Optional default value
}
variable "vm_name" {
  type = string

}
variable "vm_size" {
  type    = string
  default = "Standard_DS1_v2"

}

variable "admin_username" {
  type = string

}

variable "admin_password" {
  type = string

}
variable "storage_ac_type" {
  type    = string
  default = "Standard_LRS"

}
