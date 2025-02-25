variable "rg_name" {
  default = "terraformrg"
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
variable "vm_name" {
    type = string
  
}
variable "vm_size" {
  type        = string
  default     = "Standard_DS1_v2"
  
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