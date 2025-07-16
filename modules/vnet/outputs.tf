output "vnet-name" {
    value = azurerm_virtual_network.aks-vnet.name
}
output "vnet-id" {
    value = azurerm_virtual_network.aks-vnet.id  
}
output "subnets" {
    value = [for s in azurermazurerm_subnet.subnets:s.id]
  
}