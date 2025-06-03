output "nic_id" {
  value = {for key , nic_ka_id in azurerm_network_interface.nic : key => nic_ka_id.id} 
}