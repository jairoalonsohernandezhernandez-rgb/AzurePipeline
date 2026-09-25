output "vnet_id" {
    description = "ID de la Vnet Spoke"
    value = azurerm_virtual_network.spoke.id
}

output "pe_subnet_id" {
    description = "ID de la subred de Private Endpoints"
    value = azurerm_subnet.pe_subnet.id
}

output "vm_subnet_id" {
    description = "ID de la subred de la VM"
    value = azurerm_subnet.vm_subnet.id
}

output "bd_subnet_id" {
    description = "Id de la subnet de la base de datos"
    value = azurerm_subnet.BD_subnet.id
}