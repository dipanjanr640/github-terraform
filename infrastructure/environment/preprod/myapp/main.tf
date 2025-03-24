module "preprod_myapp_vnet" {
  source    = "../../../modules/networking/vnet"
  vnet_name = var.vnet_name
  location  = var.location
  rg_name   = var.rg_name

}

module "preprod_myapp_network_nic" {
  source                  = "../../../modules/networking/ip_config"
  vnet_name               = var.vnet_name
  location                = var.location
  rg_name                 = var.rg_name
  create_subnet           = true
  subnet_address_prefixes = var.subnet_address_prefixes
  vm_name                 = "${var.vm_name}-appserver01"
  nic_name                = "${var.vm_name}-appserver01-nic"
  depends_on              = [module.preprod_myapp_vnet]
  security_rules          = var.security_rules_list

}

module "preprod_vm" {
  source          = "../../../modules/vm"
  rg_name         = var.rg_name1
  location        = var.location
  vm_name         = "${var.vm_name}-appserver01"
  vm_size         = var.vm_size
  admin_username  = var.admin_username
  admin_password  = random_password.vm_password.result
  storage_ac_type = var.storage_ac_type
  nic_id          = [module.preprod_myapp_network_nic.nic_id]
  tags_list       = var.tags_list

}

resource "random_password" "vm_password" {
  length  = 6
  special = true

}