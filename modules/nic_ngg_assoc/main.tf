data "azurerm_network_interface" "nic" {
    name                = "nic_vm_terraform"
    resource_group_name = "rg_vm_terraform"
  
}
data "azurerm_network_security_group" "nsg" {
  name = "acceptanceTestSecurityGroup1"
    resource_group_name = "rg_vm_terraform"
}

resource "azurerm_network_interface_security_group_association" "nsg_assoc" {

  network_interface_id      = data.azurerm_network_interface.nic.id
  network_security_group_id = data.azurerm_network_security_group.nsg.id
}