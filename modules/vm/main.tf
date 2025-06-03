resource "azurerm_virtual_machine" "vm1" {
  for_each = var.vm
  name                  = each.value.name
  location              = each.value.location
  resource_group_name   = each.value.rg_name
  network_interface_ids = [var.nic_id,]
  vm_size               = each.value.size

  storage_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.virsion
  }
  storage_os_disk {
    name              = each.value.storage_os_dsk_name
    caching           = each.value.storage_os_dsk_caching
    create_option     = each.value.create_option
    managed_disk_type = each.value.managed_disk_type
  }
  os_profile {
    computer_name  = var.computer_name
    admin_username = var.admin_username
    admin_password = var.admin_password
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  }