resource "azurerm_storage_account" "st" {
    name = var.storage_account_name
    resource_group_name = var.resource_group_name
    location = var.location
    account_tier = "Standard"
    account_replication_type = "LRS"
    public_network_access_enabled = false
}

resource "azurerm_private_dns_zone" "dns_blob" {
    name = "privatelink.blob.core.windows.net"
    resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "link" {
    name = "dns-link-spoke"
    resource_group_name = var.resource_group_name
    private_dns_zone_name = azurerm_private_dns_zone.dns_blob.name
    virtual_network_id = var.spoke_vnet_id
}

resource "azurerm_private_endpoint" "pe-blob" {
    name = "pe-${var.storage_account_name}"
    resource_group_name = var.resource_group_name
    location = var.location
    subnet_id = var.pe_subnet_id

    private_service_connection {
        name = "psc-blob"
        private_connection_resource_id = azurerm_storage_account.st.id
        is_manual_connection = false

        subresource_names = ["blob"]
    }

  private_dns_zone_group {
    name = "dns-group-blob"
    private_dns_zone_ids = [azurerm_private_dns_zone.dns_blob.id]
  }
}