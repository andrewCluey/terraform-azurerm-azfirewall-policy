resource "azurerm_resource_group" "rg_test_policy" {
  name     = "rg-fw_policy_testing"
  location = "uksouth"
}


module "fw_policy_parent" {
  source              = "../../"
  resource_group_name = azurerm_resource_group.rg_test_policy.name
  location            = "uksouth"
  fw_policy_name      = "fw_parent_policy"
  threat_intell_mode  = "Alert"
  sku                 = "Standard"

}