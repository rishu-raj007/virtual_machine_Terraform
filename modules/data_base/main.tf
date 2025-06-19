resource "azurerm_mssql_server" "example" {
  for_each            = var.mysql_server
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  administrator_login          = each.value.administrator_login
  administrator_login_password = each.value.administrator_login_password


  version = each.value.version


}
# resource "azurerm_sql_server" "example" {
#     for_each = var.mysql_server
#   name                         = each.value.name
#   resource_group_name          = each.value.resource_group_name
#   location                     = each.value.location
#   version                      = each.value.version
#   administrator_login          = each.value.administrator_login
#   administrator_login_password = each.value.administrator_login_password
# }
