#optional. you can directly pass the value in main.tf 
output "nic_id" {
  value = module.preprod_myapp_network_nic.nic_id
}
output "subnet_name" {
  value = module.preprod_myapp_network_nic.subnet_name
}
output "pip_address" {
  value = module.preprod_myapp_network_nic.pip_name
}
output "vm_name" {
  value = module.preprod_vm.vm_name
}
output "vm_password" {
  value = nonsensitive(random_password.vm_password.result)
}

