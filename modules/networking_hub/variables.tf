variable "resource_group_name" {
    type = string
    description = "Nombre del grupo de recursos donde se implementará el hub"
}

variable "location" {
    type = string
    description = "Región del Azure"
}

variable "hub_vnet_name" {
    type = string
    description = "Nombre de la VNet Hub"
}

variable "hub_address_space" {
    type = string
    description = "Espacio de direcciones de la VNet Hub"
}

variable "nat_subnet_prefix" {
    type = string
    description = "Prefijo de dirección para la subred NAT"
}