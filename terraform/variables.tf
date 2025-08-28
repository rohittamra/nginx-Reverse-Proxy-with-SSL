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

variable "public_key_path" {
  default = "terraform/linux_tweet_key.pub"
}