rg_name                 = "preprod-myapp-rg"
location                = "East US"
vnet_name               = "preprod-myapp-vnet"
subnet_address_prefixes = ["10.0.2.0/24"]
security_rules_list = [
  {
    name                       = "allow_all_inbound"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  },
  {
    name                       = "allow_all_outbound"
    priority                   = 110
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
]
vm_name         = "preprod-myapp-vm"
vm_size         = "Standard_DS1_v2"
admin_username  = "ubuntu"
admin_password  = "Indira033@"
storage_ac_type = "Standard_LRS"
create_subnet   = true
tags_list = [
  { key = "env", value = "preprod" },
  { key = "app", value = "myapp" },
  { key = "Owner", value = "Dip" },
  { key = "Team", value = "DevOps" },
  { key = "Terraform", value = "true" }
]


