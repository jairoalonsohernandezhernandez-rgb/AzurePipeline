resource "azurerm_network_interface" "vm_nic" {
    name = "azure-jairo-no1-nic"
    location = var.location
    resource_group_name = var.resource_group_name

    ip_configuration {
        name = "internal"
        subnet_id = var.id_subnet
        private_ip_address_allocation = "Dynamic"
    }
}

resource "azurerm_linux_virtual_machine" "vm" {
    name = "vm-azure-no1"
    location = var.location
    resource_group_name = var.resource_group_name
    size = "Standard_B1s"
    admin_username = var.admin_username

    network_interface_ids = [
        azurerm_network_interface.vm_nic.id
    ]

    admin_ssh_key {
        username = var.admin_username
        public_key = var.admin_ssh_key
    }

    os_disk {
        caching = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    source_image_reference {
        publisher = "Canonical"
        offer = "0001-com-ubuntu-server-jammy"
        sku = "22_04-lts"
        version = "latest"
    }
}