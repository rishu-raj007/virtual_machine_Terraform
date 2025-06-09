variable "subscription_id" {
    type = string
    default = "4c09d51a-2dd9-421f-bff0-ca616d92ca42"
    sensitive = true
}
variable "parent_rg2" {
  
}
variable "parent_vnet1" {
  
}
variable "parent_subnet" {
  
}
variable "parent_nic" {
  
}
variable "parent_vm" {
   
}
variable "parent_computer_name" {
    type = string
    default = "pentaloons"
  
}
variable "parent_admin_username" {
    type = string
    default = "pentaloonsAdmin"
    sensitive = true
  
}
variable "parent_admin_password" {
    type = string
    sensitive = true
    default = "pentaloons@1234"
  
}