parent_rg2 = {
  "rg" = {
    rg_name  = "rg_vm_terraform"
    location = "centralindia"
  }
}
parent_vnet1 = {
  "vnet1" = {
    vnet_name     = "vnet_vm_terraform"
    address_space = ["10.0.0.0/20"]
    rg_name       = "rg_vm_terraform"
    location      = "centralindia"
  }
}
parent_subnet = {
  "frontend" = {
    rg_name        = "rg_vm_terraform"
    name           = "subnet_vm_terraform_frontend"
    vnet_name      = "vnet_vm_terraform"
    address_prefix = ["10.0.0.0/29"]
  }
  "backend" = {
    rg_name        = "rg_vm_terraform"
    name           = "subnet_vm_terraform_backend"
    vnet_name      = "vnet_vm_terraform"
    address_prefix = ["10.0.0.8/29"]
  }
}
parent_nic = {
  "nic" = {
    name                  = "nic_vm_terraform"
    location              = "centralindia"
    rg_name               = "rg_vm_terraform"
    ip_config_name        = "ipconfig_vm_terraform"
    private_ip_allocation = "Dynamic"
    subnet_name           = "subnet_vm_terraform"
  }
}
parent_vm = {
  frontend_vm = {
    name           = "vm_terraform"
    location       = "centralindia"
    rg_name        = "rg_vm_terraform"
    size           = "Standard_D2s_v3"
    admin_username = "azureuser"
    admin_password = "P@ssw0rd1234!"
    # This should match the NIC name defined in parent_nic
    publisher              = "Canonical"
    offer                  = "0001-com-ubuntu-server-focal"
    sku                    = "20_04-lts"
    virsion                = "latest"
    storage_os_dsk_name    = "myosdisk1"
    storage_os_dsk_caching = "ReadWrite"
    create_option          = "FromImage"
    managed_disk_type      = "Standard_LRS"
    # computer_name = "vmTerraform"
    admin_username = "azureadmin"
    admin_password = "chholabhatura@1234"

  }
  backend_vm = {
    name           = "vm_terraform"
    location       = "centralindia"
    rg_name        = "rg_vm_terraform"
    size           = "Standard_D2s_v3"
    admin_username = "azureuser"
    admin_password = "P@ssw0rd1234!"
    # This should match the NIC name defined in parent_nic
    publisher              = "Canonical"
    offer                  = "0001-com-ubuntu-server-focal"
    sku                    = "20_04-lts"
    virsion                = "latest"
    storage_os_dsk_name    = "myosdisk1"
    storage_os_dsk_caching = "ReadWrite"
    create_option          = "FromImage"
    managed_disk_type      = "Standard_LRS"
    # computer_name = "vmTerraform"
    admin_username = "azureadmin"
    admin_password = "chholabhatura@1234"

  }
}
parent_public_ip = {
  "pip" = {
    name              = "pip_vm_terraform"
    rg_name           = "rg_vm_terraform"
    location          = "centralindia"
    allocation_method = "Static"
  }
}
parent_mysql_server = {
  "mysql-server" = {
    name                             = "mysql-server-terraform"
    location                         = "centralindia"
    resource_group_name              = "rg_vm_terraform"
    administrator_login              = "mysqladmin"
    administrator_login_password     = "P@ssw0rd1234!"
    sku_name                         = "GP_Gen5_2"
    storage_mb                       = 512
    version                          = "2.0"
    ssl_minimal_tls_version_enforced = "TLS1_2"
  }
}