#optional. you can directly pass the value in main.tf 
output "nic_id" {
  value = module.preprod_myapp_network.nic_id
}
