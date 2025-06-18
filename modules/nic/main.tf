data "azurerm_public_ip" "pip" {
  name                = "pip_vm_terraform"
  resource_group_name = "rg_vm_terraform"
}
resource "azurerm_network_interface" "nic" {
    for_each = var.nic
    name                = each.value.name
    location = each.value.location
    resource_group_name = each.value.rg_name 
    
    ip_configuration {
      name = "my-ipconfig"
      private_ip_address_allocation = each.value.private_ip_allocation
      subnet_id                     = var.subnet_id
      public_ip_address_id = data.azurerm_public_ip.pip.id
    }
}