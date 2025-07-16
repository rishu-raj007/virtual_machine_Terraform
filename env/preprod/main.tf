module "resource_group" {
  source = "../../modules/rg"
  rg2    = var.parent_rg2

}
module "vnet" {
  depends_on = [module.resource_group]
  source     = "../../modules/vnet"
  vnet1      = var.parent_vnet1

}
module "subnet" {
  depends_on = [module.vnet]
  source     = "../../modules/subnet"
  subnet_vm  = var.parent_subnet

}
module "nic" {
  depends_on = [module.subnet, module.public_ip]
  source     = "../../modules/nic"
  nic        = var.parent_nic
  subnet_id  = module.subnet.id["backend"]
}
module "vm" {
  depends_on     = [module.nic]
  source         = "../../modules/vm"
  vm             = var.parent_vm
  nic_id         = module.nic.nic_id["nic"]
  computer_name  = var.parent_computer_name
  admin_username = var.parent_admin_username
  admin_password = var.parent_admin_password

}
module "public_ip" {
  depends_on = [module.resource_group]
  source     = "../../modules/public_ip"
  public_ip  = var.parent_public_ip
}
# module "sql-server" {
#   source       = "../../modules/data_base"
#   mysql_server = var.parent_mysql_server

# }
module "nsg" {
  depends_on = [ module.resource_group, module.vnet]
  source = "../../modules/nsg"
  
}
module "nsgassoc" {
  depends_on = [ module.nic, module.nsg, module.resource_group]
  source = "../../modules/nic_ngg_assoc"
}
module "key_vault" {
  
  depends_on = [ module.resource_group ]
  source     = "../../modules/azure_key_vault"
  key_vault  = var.parent_key_vault
}