
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

variable "base_policy_id" {
  type        = string
  description = "description"
  default     = null
}

variable "threat_intell_mode" {
  type        = string
  description = "description"
  default     = "Alert"
  validation {
    condition     = var.threat_intell_mode == "Alert" || var.threat_intell_mode == "Deny" || var.threat_intell_mode == "Off"
    error_message = "Sorry, but this input must be either 'Alert', 'Deny' or 'Off'."
  }
}

variable "threat_intelligence_allowlist" {
  type = object({
    ip_addresses = list(string)
    fqdns        = list(string)
  })
  description = <<EOD
  ip_addresses - A list of IP addresses or IP address ranges that will be skipped for threat detection.
  fqdns        - A list of FQDNs that will be skipped for threat detection.
EOD
  default     = {}
}

variable "dns" {
  type = object({
    servers       = string
    proxy_enabled = bool
  })
  description = <<EOD
  servers       - A list of custom DNS servers' IP addresses.  
  proxy_enabled - Whether to enable DNS proxy on Firewalls attached to this Firewall Policy? Defaults to false.
EOD
  default     = {}
}


variable "sku" {
  type        = string
  description = "description"
  default     = "Standard"
}


variable "tags" {
  type        = string
  description = ""
  default     = {}
}


