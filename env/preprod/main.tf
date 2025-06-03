module "resource_group" {
    source = "../../modules/rg"
    rg2=var.parent_rg2
  
}
module "vnet" {
    source = "../../modules/vnet"
    vnet1=var.parent_vnet1
  
}
module "subnet" {
    depends_on = [ module.vnet ]
    source = "../../modules/subnet"
    subnet_vm = var.parent_subnet
  
}
module "nic" {
  depends_on = [ module.subnet ]
  source = "../../modules/nic"
  nic = var.parent_nic
  subnet_id = module.subnet.id["backend"]
}
module "vm" {
  depends_on = [ module.nic ]
  source = "../../modules/vm"
  vm = var.parent_vm
  nic_id = module.nic.nic_id["nic"]
  computer_name = var.parent_computer_name
  admin_username = var.parent_admin_username
  admin_password = var.parent_admin_password
  
}
