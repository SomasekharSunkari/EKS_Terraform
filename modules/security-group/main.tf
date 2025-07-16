resource "azurerm_network_security_group" "aks-vnet-sg-main" {
  name                = local.sg-name
  location            = var.location
  resource_group_name = var.rg_name

}

resource "azurerm_network_security_rule" "rules" {
  for_each                    = local.nsg_rules
  name                        = each.key
  priority                    = each.value.priority
  direction                   = each.value.direction
  access                      = each.value.access
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_range      = each.value.destination_port_range
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = var.rg_name
  network_security_group_name = azurerm_network_security_group.aks-vnet-sg-main.name

}