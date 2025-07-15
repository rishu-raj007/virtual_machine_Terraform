resource "azurerm_key_vault" "secret_key" {
    for_each = var.key_vault
    name = each.value.key_vault_name
    location = each.value.location
    resource_group_name = each.value.resource_group_name
    tenant_id = data.azurerm_client_config.client_data.tenant_id
    sku_name = each.value.sku_name
  
}