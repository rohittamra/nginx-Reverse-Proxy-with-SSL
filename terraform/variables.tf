variable "resource_group_name" {
  default = "linux-tweet-rg"
}

variable "location" {
  default = "eastus"
}

variable "vm_name" {
  default = "linux-tweet-vm"
}

variable "admin_username" {
  default = "azureuser"
}

variable "admin_password" {
  description = "Admin password for the Linux VM"
  type        = string
  sensitive   = true
}