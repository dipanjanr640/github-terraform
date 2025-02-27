resource "azurerm_virtual_network" "my_vnet" {
  name                = var.vnet_name
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.rg_name
}

resource "azurerm_subnet" "my_subnet" {
  name                 = "${var.vnet_name}-subnet"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.my_vnet.name
  address_prefixes     = var.subnet_address_prefixes
  depends_on = [ azurerm_virtual_network.my_vnet ]
  
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
    subnet_id                     = azurerm_subnet.my_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.pip.id
  }
  depends_on = [ azurerm_subnet.my_subnet, azurerm_public_ip.pip ]
}
resource "azurerm_network_security_group" "nsg" {
  name                = "${var.rg_name}-nsg"
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
    priority                   = 100
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
  subnet_id                 = azurerm_subnet.my_subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
  depends_on = [ azurerm_subnet.my_subnet, azurerm_network_security_group.nsg ]
}
