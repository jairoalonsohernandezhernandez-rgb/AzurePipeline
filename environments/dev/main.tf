terraform {
    required_version = ">= 1.5.0"
    required_providers{
        azurerm = {
            source = "hashicorp/azurerm"
            version = "~> 3.90.0"
        }
    }
}

provider "azurerm" {
    features {}
}

resource "azurerm_resource_group" "rg" {
    name = "rg-landingzone-dev"
    location = "eastus"
}

module "hub_network" {
    source = "../../modules/networking_hub"
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
    hub_vnet_name = "vnet-hub-dev"
    hub_address_space = "10.0.0.0/16"
    nat_subnet_prefix = "10.0.1.0/24"
}

module "spoke_network" {
    source = "../../modules/networking_spoke"
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
    spoke_vnet_name = "vnet-spoke-dev"
    spoke_address_space = "10.1.0.0/16"
    pe_subnet_prefix = "10.1.1.0/24"
    vm_subnet_prefix = "10.1.2.0/24"
    bd_subnet_prefix = "10.1.3.0/24"
    hub_vnet_name = module.hub_network.vnet_name
    hub_vnet_id = module.hub_network.vnet_id
}

module "secure_storage"{
    source = "../../modules/secure_storage"
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
    storage_account_name = "storageaccountdev777"
    pe_subnet_id = module.spoke_network.pe_subnet_id
    spoke_vnet_id = module.spoke_network.vnet_id
}

module "virtual_machine" {
    source = "../../modules/virtual_machine"
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    id_subnet = module.spoke_network.vm_subnet_id
    admin_username = "jairoazureadmin"
    admin_ssh_key = var.admin_ssh_key
}

module "database" {
    source = "../../modules/database"
    location = azurerm_resource_group.rg.location
    resource_group = azurerm_resource_group.rg.name
    id_subnet = module.spoke_network.bd_subnet_id
    db_admin_password = var.db_admin_password
    admin_username = module.virtual_machine.admin_username
    server_name = "server-jairoazure-001"
    BD_name = "database_no1"
    backup_storage_redundancy = "Local"
}