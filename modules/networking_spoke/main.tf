resource "azurerm_virtual_network" "spoke" {
    name = var.spoke_vnet_name
    location = var.location
    resource_group_name = var.resource_group_name
    address_space = [var.spoke_address_space]
}

resource "azurerm_subnet" "pe_subnet" {
    name = "snet-private-endpoints"
    resource_group_name = var.resource_group_name
    virtual_network_name = azurerm_virtual_network.spoke.name
    address_prefixes = [var.pe_subnet_prefix]
}

resource "azurerm_subnet" "vm_subnet" {
    name = "snet-vm"
    resource_group_name = var.resource_group_name
    virtual_network_name = azurerm_virtual_network.spoke.name
    address_prefixes = [var.vm_subnet_prefix]
}

resource "azurerm_subnet" "BD_subnet" {
    name = "snet-bd"
    resource_group_name = var.resource_group_name
    virtual_network_name = azurerm_virtual_network.spoke.name
    address_prefixes = [var.bd_subnet_prefix]
}

resource "azurerm_virtual_network_peering" "hub_to_spoke" {
    name = "peering-hub-to-spoke"
    resource_group_name = var.resource_group_name
    virtual_network_name = var.hub_vnet_name
    remote_virtual_network_id = azurerm_virtual_network.spoke.id
    allow_virtual_network_access = true
    allow_forwarded_traffic = true
}

resource "azurerm_virtual_network_peering" "spoke_to_hub" {
    name = "peering-spoke-to-hub"
    resource_group_name = var.resource_group_name
    virtual_network_name = var.spoke_vnet_name
    remote_virtual_network_id = var.hub_vnet_id
    allow_virtual_network_access = true
    allow_forwarded_traffic = true
}