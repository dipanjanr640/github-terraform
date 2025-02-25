module "preprod_vm" {
  source = "../../../modules/vm"
  rg_name = var.rg_name
  location = var.location
  vnet_name = var.vnet_name
  nic_name = var.nic_name
  vm_name = var.vm_name
  vm_size = var.vm_size
  admin_username = var.admin_username
  admin_password = var.admin_password
  storage_ac_type = var.storage_ac_type
  subnet_address_prefixes = var.subnet_address_prefixes
}