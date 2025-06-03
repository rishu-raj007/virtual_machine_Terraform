output "id" { 
  value = {for key , subnet_ka_id in azurerm_subnet.subnet1 : key => subnet_ka_id.id }
  }
