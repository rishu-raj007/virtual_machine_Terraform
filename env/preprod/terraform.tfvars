parent_rg2 = {
    "rg"={
        rg_name="rg_vm_terraform"
        location="eastus"
    }
}
parent_vnet1 = {
    "vnet1"={
        vnet_name="vnet_vm_terraform"
        address_space=["10.0.0.0/26"]
        rg_name= "rg_vm_terraform"
        location ="eastus"
    }
}
parent_subnet = {
    "frontend"={
        rg_name="rg_vm_terraform"
        name ="subnet_vm_terraform"
        vnet_name="vnet_vm_terraform"
        address_prefix=["10.0.0.0/29"]
    }
    "backend"={
        rg_name="rg_vm_terraform_backend"
        name ="subnet_vm_terraform_backend"
        vnet_name="vnet_vm_terraform"
        address_prefix=["10.0.0.0/29"]
    }
}
parent_nic = {
    "nic"={
        name ="nic_vm_terraform"
        location="eastus"
        rg_name="rg_vm_terraform"
        ip_config_name="ipconfig_vm_terraform"
        private_ip_allocation="Dynamic"
        subnet_name="subnet_vm_terraform"
    }
}
parent_vm = {
    vm ={
        name = "vm_terraform"
        location = "eastus"
        rg_name = "rg_vm_terraform"
        size = "Standard_DS1_v2"
        admin_username = "azureuser"
        admin_password = "P@ssw0rd1234!"
        # This should match the NIC name defined in parent_nic
        publisher = "Canonical"
        offer = "0001-com-ubuntu-server-jammy"
        sku = "22_04-lts"
        virsion = "latest"
        storage_os_dsk_name = "myosdisk1"
        storage_os_dsk_caching = "ReadWrite"
        create_option = "FromImage"
        managed_disk_type = "Standard_LRS"
        computer_name = "vm-terraform"
        admin_username = "azureadmin"
        admin_password = "chholabhatura@1234"   
        
    }
}
