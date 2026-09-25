variable "admin_username" {
    type  = string
    description = "Nombre de usuario administrador de la Base de Datos"
}

variable "db_admin_password" {
    type = string
    description = "Contrseña de administrador de la Base de Datos"
    sensitive = true
}

variable "location" {
    type = string
    description = "Región donde se implementará la Base de Datos"
}

variable "resource_group" {
    type = string
    description = "Grupo de resursos donde se implementará la Base de Datos"
}

variable "BD_name" {
    type = string
    description = "Nombre de la Base de Datos"
}

variable "server_name" {
    type = string
    description = "Nombre del server de la Base de Datos"
}

variable "id_subnet" {
    type = string
    description = "Id de la subnet para la base da datos"
}

variable "backup_storage_redundancy" {
    type = string
    description = "Forma de almacenamiento de las copias de seguridad"
    default = "Local"
}