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
variable "subnet_address_prefixes" {
  type    = list(string)
}
variable "vm_name" {
    type = string
  
}
variable "vm_size" {
  type        = string
  
}

variable "admin_username" {
  type        = string
  
}

variable "admin_password" {
  type        = string
  
}
variable "storage_ac_type" {
    type = string
  
}