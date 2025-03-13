variable "rg_name" {
  type = string

}
variable "location" {
  type = string

}
variable "nic_id" {
  type = list(string)

}
variable "vm_name" {
  type = string

}
variable "vm_size" {
  type = string

}

variable "admin_username" {
  type = string

}

variable "admin_password" {
  type = string

}
variable "storage_ac_type" {
  type = string

}

variable "tags_list" {
  description = "List of tag objects"
  type = list(object({
    key   = string
    value = string
  }))
}