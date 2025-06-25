resource "azurerm_linux_virtual_machine" "example" {
  for_each = var.vm
  name                = each.value.name
  resource_group_name = each.value.rg_name
  location            = each.value.location
  size                = each.value.size
  admin_username      = var.admin_username
  computer_name = var.computer_name
  admin_password      = var.admin_password
  disable_password_authentication = false
  network_interface_ids = [
    var.nic_id,
  ]

  os_disk {
    caching              = each.value.storage_os_dsk_caching
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
     sku       = each.value.sku
   version   = each.value.virsion
  }
    custom_data = base64encode(<<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y nginx
              systemctl enable nginx
              systemctl start nginx
              git clone https://github.com/devopsinsiders/StreamFlix.git
              cd StreamFlix
              cp -r * /var/www/html/
              EOF
  )

}


