output "id_subnet" {
    description = "ID de la subred donde se encuentra la VM"
    value = var.id_subnet
}

output "linux_vm_id" {
    description = "ID de la máquina virtual Linux"
    value = azurerm_linux_virtual_machine.vm.id
}

output "ip_VM" {
    description = "Dirección IP privada de la VM"
    value = azurerm_network_interface.vm_nic.private_ip_address
}

output "admin_username" {
    description = "Nombre de el administrador de la cuenta Azure"
    value = azurerm_linux_virtual_machine.vm.admin_username
}