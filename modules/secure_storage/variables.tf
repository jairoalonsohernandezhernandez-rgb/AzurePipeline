variable "resource_group_name" {
    type = string
    description = "Nombre del grupo de recursos donde se implementará todo"
}

variable "location" {
    type = string
    description = "Región de implementación de Azure"
}

variable "storage_account_name" {
    type = string
    description = "Nombre de la cuenta de almacenamiento"
}

variable "spoke_vnet_id" {
    type = string
    description = "ID de la VNet Spoke"
}

variable "pe_subnet_id" {
    type = string
    description = "ID de la subred donde se implementará el Private Endpoint"
}