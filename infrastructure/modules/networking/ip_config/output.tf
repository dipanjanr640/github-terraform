output "nic_id" {
  value = azurerm_network_interface.my_nic.id
}
output "subnet_name" {
  value = var.create_subnet ? azurerm_subnet.my_subnet[0].name : data.azurerm_subnet.existing_subnet[0].name
}
output "pip_name" {
  value = azurerm_public_ip.pip.ip_address
}