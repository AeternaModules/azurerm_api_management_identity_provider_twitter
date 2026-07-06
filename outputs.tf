output "api_management_identity_provider_twitters" {
  description = "All api_management_identity_provider_twitter resources"
  value       = azurerm_api_management_identity_provider_twitter.api_management_identity_provider_twitters
  sensitive   = true
}
output "api_management_identity_provider_twitters_api_key" {
  description = "List of api_key values across all api_management_identity_provider_twitters"
  value       = [for k, v in azurerm_api_management_identity_provider_twitter.api_management_identity_provider_twitters : v.api_key]
  sensitive   = true
}
output "api_management_identity_provider_twitters_api_management_name" {
  description = "List of api_management_name values across all api_management_identity_provider_twitters"
  value       = [for k, v in azurerm_api_management_identity_provider_twitter.api_management_identity_provider_twitters : v.api_management_name]
}
output "api_management_identity_provider_twitters_api_secret_key" {
  description = "List of api_secret_key values across all api_management_identity_provider_twitters"
  value       = [for k, v in azurerm_api_management_identity_provider_twitter.api_management_identity_provider_twitters : v.api_secret_key]
  sensitive   = true
}
output "api_management_identity_provider_twitters_resource_group_name" {
  description = "List of resource_group_name values across all api_management_identity_provider_twitters"
  value       = [for k, v in azurerm_api_management_identity_provider_twitter.api_management_identity_provider_twitters : v.resource_group_name]
}

