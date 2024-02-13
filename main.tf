
resource "azurerm_firewall_policy" "fw_policy" {
  name                     = var.fw_policy_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  sku                      = var.sku
  base_policy_id           = var.base_policy_id
  threat_intelligence_mode = var.threat_intell_mode
  tags                     = var.tags

  dynamic "threat_intelligence_allowlist" {
    for_each = lookup(var.threat_allowlist, "threat_intelligence_allowlist", {}) != {} ? [1] : []

    content {
      ip_addresses = lookup(each.value.delegation, "ip_addresses", null)
      fqdns        = lookup(var.threat_allowlist, "fqdns", null)
    }
  }


  dns {
    servers = var.dns.servers
    proxy_enabled = var.dns.proxy_enabled
  }

}