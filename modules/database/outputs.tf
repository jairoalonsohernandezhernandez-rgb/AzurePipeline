output "db_server_fqdn" {
    description = "Nombre del dominio para direccionar a interner"
    value = azurerm_mssql_server.my_server.fully_qualified_domain_name
}

output "id_pe_db" {
    description = "Id de el private endpoint para la BD"
    value = azurerm_private_endpoint.sql_private_endpoint.id
}

output "bd_name" {
    description = "Nombre de la Base de datos"
    value = azurerm_mssql_database.database_no1.name
}