resource "azurerm_virtual_network" "aks-vnet" {
  name                = local.vnet-name
  location            = var.location
  resource_group_name = var.rg-name
  address_space       = local.address_space
}

resource "azurerm_subnet" "subnets" {
  count                = local.subnets.length
  name                 = "subnet-${count.index}"
  address_prefixes     = element(local.subnets, count.index)
  virtual_network_name = azurerm_virtual_network.aks-vnet.name
  resource_group_name  = var.rg-name
}