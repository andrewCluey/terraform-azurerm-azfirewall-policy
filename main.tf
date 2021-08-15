

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



/*
locals {
  policy_rule_collection_name = var.fw_rule_collection_group_name != "" ? var.fw_rule_collection_group_name : "${var.fw_policy_name}-rcg"
}

resource "azurerm_firewall_policy_rule_collection_group" "rule_collection_group" {
  name               = local.policy_rule_collection_name
  firewall_policy_id = azurerm_firewall_policy.fw_policy.id
  priority           = 500

  application_rule_collection {
    name     = "app_rule_collection1"
    priority = 500
    action   = "Deny"
    rule {
      name = "app_rule_collection1_rule1"
      protocols {
        type = "Http"
        port = 80
      }
      protocols {
        type = "Https"
        port = 443
      }
      source_addresses  = ["10.0.0.1"]
      destination_fqdns = [".microsoft.com"]
    }
  }

  network_rule_collection {
    name     = "network_rule_collection1"
    priority = 400
    action   = "Deny"
    rule {
      name                  = "network_rule_collection1_rule1"
      protocols             = ["TCP", "UDP"]
      source_addresses      = ["10.0.0.1"]
      destination_addresses = ["192.168.1.1", "192.168.1.2"]
      destination_ports     = ["80", "1000-2000"]
    }
  }

  nat_rule_collection {
    name     = "nat_rule_collection1"
    priority = 300
    action   = "Dnat"
    rule {
      name                = "nat_rule_collection1_rule1"
      protocols           = ["TCP", "UDP"]
      source_addresses    = ["10.0.0.1", "10.0.0.2"]
      destination_address = "192.168.1.1"
      destination_ports   = ["80", "1000-2000"]
      translated_address  = "192.168.0.1"
      translated_port     = "8080"
    }
  }
}
*/