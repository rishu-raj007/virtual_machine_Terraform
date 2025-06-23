resource "azurerm_mssql_server" "mysql_server" {
  for_each            = var.mysql_server
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  administrator_login          = each.value.administrator_login
  administrator_login_password = each.value.administrator_login_password
  version = each.value.version
}
data "azurerm_mssql_server" "msserver" {
    for_each = var.mysql_server
    name     = each.value.name
    resource_group_name = each.value.resource_group_name
  
}
resource "azurerm_mssql_database" "mysql_database" {
  name         = "example-db"
  server_id    = data.azurerm_mssql_server.msserver[each.key].id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"

  tags = {
    foo = "bar"
  }

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }
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
