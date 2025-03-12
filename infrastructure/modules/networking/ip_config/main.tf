resource "azurerm_subnet" "my_subnet" {
  count                = var.create_subnet ? 1 : 0 # If false, subnet is skipped
  name                 = "${var.vnet_name}-subnet"
  resource_group_name  = var.rg_name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.subnet_address_prefixes

}
data "azurerm_subnet" "existing_subnet" {
  count                = var.create_subnet ? 0 : 1 # Use only when skipping creation
  name                 = "${var.vnet_name}-subnet"
  resource_group_name  = var.rg_name
  virtual_network_name = var.vnet_name
}

resource "azurerm_public_ip" "pip" {
  name                = "${var.vm_name}-pip"
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "my_nic" {
  name                = var.nic_name
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.create_subnet ? azurerm_subnet.my_subnet[0].id : data.azurerm_subnet.existing_subnet[0].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
  #depends_on = [azurerm_subnet.my_subnet]

}
resource "azurerm_network_security_group" "nsg" {
  count               = var.create_subnet ? 1 : 0 # If false, subnet is skipped.
  name                = "${var.create_subnet ? azurerm_subnet.my_subnet[0].name : data.azurerm_subnet.existing_subnet[0].name}-nsg"
  location            = var.location
  resource_group_name = var.rg_name

  security_rule {
    name                       = "allow_all_inbound"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
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
}
resource "azurerm_subnet_network_security_group_association" "nsg_subnet" {
  count                     = var.create_subnet ? 1 : 0 # If false, subnet is skipped
  subnet_id                 = var.create_subnet ? azurerm_subnet.my_subnet[0].id : data.azurerm_subnet.existing_subnet[0].id
  network_security_group_id = var.create_subnet ? azurerm_network_security_group.nsg[0].id : null

}
