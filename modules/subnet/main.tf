resource "azurerm_subnet" "subnet1" {
    for_each = var.subnet_vm
    name = each.value.name
    resource_group_name = each.value.rg_name
    virtual_network_name = each.value.vnet_name
    address_prefixes = each.value.address_prefix
}
  