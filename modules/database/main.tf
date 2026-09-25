resource "azurerm_mssql_server" "my_server" {
    name = var.server_name
    resource_group_name = var.resource_group
    location = var.location
    version = "12.0"
    administrator_login = var.admin_username
    administrator_login_password = var.db_admin_password
}

resource "azurerm_mssql_database" "database_no1" {
    name = var.BD_name
    server_id = azurerm_mssql_server.my_server.id
    sku_name = "GP_S_Gen5_1"
    auto_pause_delay_in_minutes = 60
    min_capacity = 0.5
    max_size_gb = 32
    storage_account_type = var.backup_storage_redundancy
    zone_redundant = false
}

resource "azurerm_private_endpoint" "sql_private_endpoint" {
    name = "pe-${var.server_name}"
    location = var.location
    resource_group_name = var.resource_group
    subnet_id = var.id_subnet

    private_service_connection {
        name = "psc-sql-${var.server_name}"
        private_connection_resource_id = azurerm_mssql_server.my_server.id
        subresource_names = ["sqlServer"]
        is_manual_connection = false
    }
}