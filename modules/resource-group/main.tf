resource "azurerm_resource_group" "aks" {
    name = var.rg_name
    location = var.location
}