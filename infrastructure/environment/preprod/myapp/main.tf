module "preprod_myapp_network" {
  source = "../../../modules/networking"
  vnet_name = var.vnet_name
  location = var.location
  rg_name = var.rg_name
  subnet_address_prefixes = var.subnet_address_prefixes
  vm_name = var.vm_name  
  nic_name = var.nic_name
  
}

module "preprod_vm" {
  source = "../../../modules/vm"
  rg_name = var.rg_name  
  location = var.location
  vm_name = var.vm_name
  vm_size = var.vm_size
  admin_username = var.admin_username
  admin_password = var.admin_password
  storage_ac_type = var.storage_ac_type
  nic_id = [module.preprod_myapp_network.nic_id]

}