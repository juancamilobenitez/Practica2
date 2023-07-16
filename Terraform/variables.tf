# variables.tf

variable "resource_group_name" {
  description = "Nombre del grupo de recursos donde se creará el ACR."
  type        = string
  default     = "mi-resource-group" # Reemplaza con el nombre del grupo de recursos por defecto si no se proporciona.
}

variable "location" {
  description = "Región donde se desplegará el ACR."
  type        = string
  default     = "East US" # Reemplaza con la región por defecto si no se proporciona.
}

variable "acr_name" {
  description = "Nombre del Azure Container Registry."
  type        = string
  default     = "mi-acr" # Reemplaza con el nombre del ACR por defecto si no se proporciona.
}

variable "acr_sku" {
  description = "SKU del Azure Container Registry."
  type        = string
  default     = "Standard" # Reemplaza con el SKU por defecto si no se proporciona. Opciones: Basic, Standard, Premium.
}

variable "acr_admin_enabled" {
  description = "Indica si la autenticación de administrador está habilitada para el ACR."
  type        = bool
  default     = true # Puedes cambiarlo a false si deseas deshabilitar la autenticación de administrador por defecto.
}
