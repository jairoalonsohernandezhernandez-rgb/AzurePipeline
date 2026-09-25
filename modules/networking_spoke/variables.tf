variable "spoke_vnet_name" {
    type = string
    description = "Nombre de la Vnet Spoke"
}

variable "spoke_address_space" {
    type = string
    description = "Espacio de direcciones de la Vnet Spoke"
}

variable "location" {
    type = string
    description = "Región de implemetación de Azure"
}

variable "resource_group_name" {
    type = string
    description = "Nombre del grupo de recursos donde se implementará todo"
}

variable "pe_subnet_prefix" {
    type = string
    description = "Prefijo de dirección de la subred de Private Endpoints"
}

variable "hub_vnet_id" {
    type = string
    description = "ID de la VNet Hub"
}

variable "hub_vnet_name" {
    type = string
    description = "Nombre de la VNet Hub"
}

variable "vm_subnet_prefix" {
    type = string
    description = "Prefijo de direccion de la subred de la VM"
}

variable "bd_subnet_prefix" {
    type = string
    description = "Prefijo de dirección de la subred de la BD"
}
