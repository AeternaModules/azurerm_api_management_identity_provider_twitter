data "azurerm_key_vault_secret" "api_key" {
  for_each     = { for k, v in var.api_management_identity_provider_twitters : k => v if v.api_key_key_vault_id != null && v.api_key_key_vault_secret_name != null }
  name         = each.value.api_key_key_vault_secret_name
  key_vault_id = each.value.api_key_key_vault_id
}
data "azurerm_key_vault_secret" "api_secret_key" {
  for_each     = { for k, v in var.api_management_identity_provider_twitters : k => v if v.api_secret_key_key_vault_id != null && v.api_secret_key_key_vault_secret_name != null }
  name         = each.value.api_secret_key_key_vault_secret_name
  key_vault_id = each.value.api_secret_key_key_vault_id
}
resource "azurerm_api_management_identity_provider_twitter" "api_management_identity_provider_twitters" {
  for_each = var.api_management_identity_provider_twitters

  api_key             = each.value.api_key != null ? each.value.api_key : try(data.azurerm_key_vault_secret.api_key[each.key].value, null)
  api_management_name = each.value.api_management_name
  api_secret_key      = each.value.api_secret_key != null ? each.value.api_secret_key : try(data.azurerm_key_vault_secret.api_secret_key[each.key].value, null)
  resource_group_name = each.value.resource_group_name
}

