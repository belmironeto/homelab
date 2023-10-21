variable "PROXMOX_API_SECRET" {
  type    = string
  sensitive = true
}

variable "ssh_key" {
  type    = string
}

variable "proxmox_host" {
  type    = string
  default = "prxmxserver"
}

variable "template_name" {
  type    = string
  default = "ubuntu-2204-cloud-init"
}
variable "storage_name" {
  type    = string
  default = "localstorage"
}
