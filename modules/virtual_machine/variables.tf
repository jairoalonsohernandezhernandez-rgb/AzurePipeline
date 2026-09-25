variable "location" {
    type = string
    description = "La zona donde se hospeda la VM"
}

variable "resource_group_name" {
    type = string
    description = "Nombre del grupo de recursos donde está la VM"
}

variable "admin_username" {
    type = string
    description = "Nombre del usuario administrador de la VM"
}

variable "admin_ssh_key" {
    type = string
    description = "Clave pública SSH del usuario administrador de la VM"
}

variable "id_subnet" {
    type = string
    description = "ID de la subred donde se encuentra la VM"
}