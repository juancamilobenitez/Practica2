# Creación de Máquina Virtual en Azure con Terraform

Este proyecto te guiará a través de los pasos para crear una Máquina Virtual en Microsoft Azure utilizando Terraform.

## Paso 1: Configuración del archivo main.tf

1. Crea un archivo `main.tf` en el directorio donde deseas tener tu configuración de Terraform.

## Paso 2: Definición de los recursos de la Máquina Virtual

En el archivo `main.tf`, define los recursos necesarios para crear la Máquina Virtual en Azure. Por ejemplo:
```hcl


provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "myResourceGroup"
  location = "East US"
}

resource "azurerm_virtual_network" "example" {
  name                = "myVnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}
```
## Paso 3: Archivo single_vm.tf

###El archivo single_vm.tf contendrá la configuración específica para la creación de la Máquina Virtual, como el tamaño, sistema operativo, y otros detalles. Por ejemplo:
```hcl
resource "azurerm_linux_virtual_machine" "vm" {
  name                = "myVM"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  size                = "Standard_F2s_v2"
  admin_username      = "azureuser"
  admin_password      = "P@ssw0rd123!"
  image_publisher     = "Canonical"
  image_offer         = "UbuntuServer"
  image_sku           = "16.04-LTS"
}
```
##Paso 4: Archivo outputs.tf
```hcl
El archivo outputs.tf permite definir los valores que serán mostrados como salida después de crear la Máquina Virtual. Por ejemplo:


output "vm_ip_address" {
  value       = azurerm_linux_virtual_machine.vm.private_ip_address
  description = "Private IP address of the VM"
}

output "vm_public_ip" {
  value       = azurerm_linux_virtual_machine.vm.public_ip_address
  description = "Public IP address of the VM"
}
```
## Paso 5: Archivo variables.tf
```hcl

###El archivo variables.tf puede ser utilizado para definir variables que se utilizarán en el archivo main.tf. Por ejemplo


ion = "Private IP address of the VM"
}

```
## Paso 6: Inicialización de Terraform

###En la línea de comandos, navega al directorio donde se encuentra el archivo main.tf y ejecuta el siguiente comando para inicializar Terraform:

```hcl
terraform init

```

##Paso 7: Vista previa de los cambios

###Ejecuta el siguiente comando para obtener una vista previa de los cambios que Terraform realizará en la infraestructura:

```hcl

Terraform plan

```

##Paso 8: Aplicación de los cambios

###Si todo se ve bien en la vista previa, ejecuta el siguiente comando para aplicar los cambios y crear la Máquina Virtual:

```hcl

terraform apply

```

