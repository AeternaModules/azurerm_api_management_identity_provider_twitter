variable "api_management_identity_provider_twitters" {
  description = <<EOT
Map of api_management_identity_provider_twitters, attributes below
Required:
    - api_key
    - api_key_key_vault_id (optional, alternative to api_key)
    - api_key_key_vault_secret_name (optional, alternative to api_key)
    - api_management_name
    - api_secret_key
    - api_secret_key_key_vault_id (optional, alternative to api_secret_key)
    - api_secret_key_key_vault_secret_name (optional, alternative to api_secret_key)
    - resource_group_name
EOT

  type = map(object({
    api_key                              = string
    api_key_key_vault_id                 = optional(string)
    api_key_key_vault_secret_name        = optional(string)
    api_management_name                  = string
    api_secret_key                       = string
    api_secret_key_key_vault_id          = optional(string)
    api_secret_key_key_vault_secret_name = optional(string)
    resource_group_name                  = string
  }))
  validation {
    condition = alltrue([
      for k, v in var.api_management_identity_provider_twitters : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.api_management_identity_provider_twitters : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.api_management_identity_provider_twitters : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.api_management_identity_provider_twitters : (
        length(v.api_key) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.api_management_identity_provider_twitters : (
        length(v.api_secret_key) > 0
      )
    ])
    error_message = "must not be empty"
  }
  # Note: 2 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

