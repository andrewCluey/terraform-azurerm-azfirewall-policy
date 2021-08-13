
variable "resource_group_name" {
  type        = string
  description = "description"
}

variable "location" {
  type        = string
  description = "description"
  defautl     = "uksouth"
}


variable "fw_policy_name" {
  type        = string
  description = "description"
}

variable "fw_rule_collection_group_name" {
  type        = string
  description = "description"
  default     = ""
}

variable "dns" {
  type = object({
    servers       = list(string)
    proxy_enabled = bool
  })
  description = "An object to define a list of custom DNS server IP Addresses and whether DNS proxy should be enabled on Firewalls attached to this policy"
  default     = null # Uses Azure DNS for name resolution.
}

variable "sku" {
  type        = string
  description = "description"
  default     = "Standard"
}

variable "threat_intell_mode" {
  type        = string
  description = "description"
  default     = "Alert"
}


variable "base_policy_id" {
  type        = string
  description = "description"
}

variable "tags" {
  type        = string
  description = ""
  default     = {}
}


