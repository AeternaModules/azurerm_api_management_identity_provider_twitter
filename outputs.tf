output "api_management_identity_provider_twitters_api_key" {
  description = "Map of api_key values across all api_management_identity_provider_twitters, keyed the same as var.api_management_identity_provider_twitters"
  value       = { for k, v in azurerm_api_management_identity_provider_twitter.api_management_identity_provider_twitters : k => v.api_key }
  sensitive   = true
}
output "api_management_identity_provider_twitters_api_management_name" {
  description = "Map of api_management_name values across all api_management_identity_provider_twitters, keyed the same as var.api_management_identity_provider_twitters"
  value       = { for k, v in azurerm_api_management_identity_provider_twitter.api_management_identity_provider_twitters : k => v.api_management_name }
}
output "api_management_identity_provider_twitters_api_secret_key" {
  description = "Map of api_secret_key values across all api_management_identity_provider_twitters, keyed the same as var.api_management_identity_provider_twitters"
  value       = { for k, v in azurerm_api_management_identity_provider_twitter.api_management_identity_provider_twitters : k => v.api_secret_key }
  sensitive   = true
}
output "api_management_identity_provider_twitters_resource_group_name" {
  description = "Map of resource_group_name values across all api_management_identity_provider_twitters, keyed the same as var.api_management_identity_provider_twitters"
  value       = { for k, v in azurerm_api_management_identity_provider_twitter.api_management_identity_provider_twitters : k => v.resource_group_name }
}

