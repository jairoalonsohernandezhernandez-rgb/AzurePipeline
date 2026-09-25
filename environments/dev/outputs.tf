output "ip_VM" {
  description = "Dirección IP de la VM"
  value = module.virtual_machine.ip_VM
}

output "vm_id" {
    description = "ID de la VM"
    value = module.virtual_machine.linux_vm_id
}