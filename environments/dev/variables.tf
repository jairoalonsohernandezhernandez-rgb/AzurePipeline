variable "admin_ssh_key" {
    type = string
    description = "Clave pública SSH del usuario admin de la VM"
    sensitive = true
}

variable "db_admin_password" {
    type = string
    description = "Contraseña de el administrador en la Base de Datos"
    sensitive = true
}