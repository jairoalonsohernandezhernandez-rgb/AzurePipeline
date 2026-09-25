output "private_endpoint_id" {
    description = "ID del Private Endpoint"
    value = azurerm_private_endpoint.pe-blob.id
}

output "storage_account_id" {
    description = "ID de la cuenta de almacenamiento"
    value = azurerm_storage_account.st.id
}

