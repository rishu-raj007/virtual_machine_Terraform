resource "azurerm_virtual_network" "vnet1" {
    for_each = var.vnet1
    name = each.value.vnet_name
    address_space= each.value.address_space
    location = each.value.location
    resource_group_name = each.value.rg_name

  
  
}