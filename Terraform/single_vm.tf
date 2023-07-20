provider "azurerm" {
  features {}
}

resource "azurerm_virtual_machine" "existing_vm" {
  name                  = "Practica2.1"  # Cambiar por el nombre de la máquina virtual existente
  location              = "West Europe"  # Cambiar por la ubicación de la máquina virtual existente
  resource_group_name   = "cloud-shell-storage-westeurope"  # Cambiar por el nombre del grupo de recursos de la máquina virtual existente
  network_interface_ids = ["${azurerm_network_interface.existing_vm.id}"]

  storage_image_reference {
    publisher = "cognosys"
    offer     = "centos-8-0-free"
    sku       = "centos-8-0-free"
    version   = "latest"
  }

  os_profile {
    computer_name  = "Practica2.1"  # Cambiar por el nombre de la máquina virtual existente
    admin_username = "azureuser"  # Cambiar por el nombre de usuario de administrador de la máquina virtual existente
  }

  os_profile_linux_config {
    disable_password_authentication = true
  }

  tags = {
    # Agregar etiquetas si lo deseas
  }
}

# Define la interfaz de red si aún no existe en tu configuración de Terraform
resource "azurerm_network_interface" "existing_vm" {
  name                = "practica2.1474"  # Cambiar por el nombre de la interfaz de red existente
  location            = "West Europe"  # Cambiar por la ubicación de la máquina virtual existente
  resource_group_name = "cloud-shell-storage-westeurope"  # Cambiar por el nombre del grupo de recursos de la máquina virtual existente

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = "/subscriptions/a7912b57-9e2f-46cf-8b62-d8cfed223963/resourceGroups/cloud-shell-storage-westeurope/providers/Microsoft.Network/virtualNetworks/Practica2.1-vnet/subnets/default"  # Cambiar por la subred existente de la máquina virtual
    private_ip_address_allocation = "Dynamic"
  }
}
