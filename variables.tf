variable "api_management_identity_provider_twitters" {
  description = <<EOT
Map of api_management_identity_provider_twitters, attributes below
Required:
    - api_key
    - api_key_key_vault_id (alternative to api_key - read from Key Vault instead)
    - api_key_key_vault_secret_name (alternative to api_key - read from Key Vault instead)
    - api_management_name
    - api_secret_key
    - api_secret_key_key_vault_id (alternative to api_secret_key - read from Key Vault instead)
    - api_secret_key_key_vault_secret_name (alternative to api_secret_key - read from Key Vault instead)
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
  # --- Unconfirmed validation candidates, derived from azurerm_api_management_identity_provider_twitter's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: api_management_name
  #   source:    [from validate.ApiManagementServiceName] !matched
}

