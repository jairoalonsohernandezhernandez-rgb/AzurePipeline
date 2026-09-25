resource "azurerm_virtual_network" "hub" {
    name = var.hub_vnet_name
    location = var.location
    resource_group_name = var.resource_group_name
    address_space = [var.hub_address_space]
}

resource "azurerm_subnet" "nat_subnet" {
    name = "snet-nat-outbound"
    resource_group_name = var.resource_group_name
    virtual_network_name = azurerm_virtual_network.hub.name
    address_prefixes = [var.nat_subnet_prefix]
}

#NAT Gateway para salida única y segura a Internet
resource "azurerm_public_ip" "nat_pip"{
    name = "pip-nat-hub"
    location = var.location
    resource_group_name = var.resource_group_name
    allocation_method = "Static"
    sku = "Standard"
}

resource "azurerm_nat_gateway" "nat" {
    name = "nat-gateway-hub"
    location = var.location
    resource_group_name = var.resource_group_name
    sku_name = "Standard"
}

resource "azurerm_nat_gateway_public_ip_association" "assoc" {
    nat_gateway_id = azurerm_nat_gateway.nat.id
    public_ip_address_id = azurerm_public_ip.nat_pip.id
}

resource "azurerm_subnet_nat_gateway_association" "subnet_assoc" {
    subnet_id = azurerm_subnet.nat_subnet.id
    nat_gateway_id = azurerm_nat_gateway.nat.id
}