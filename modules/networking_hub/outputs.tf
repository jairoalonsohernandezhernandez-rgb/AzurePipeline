output "vnet_id" {
    description = "ID de la VNet Hub"
    value = azurerm_virtual_network.hub.id
}

output "vnet_name" {
    description = "Nombre de la VNet Hub"
    value = azurerm_virtual_network.hub.name
}