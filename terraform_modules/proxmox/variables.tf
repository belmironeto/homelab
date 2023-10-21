variable "vm" {
  type = object({
    name = string
    id = number
    ip = string
    cpu       = number
    memory    = number
    disk_size = number
    user = string
    tags = string
  })
}
variable "PROXMOX_API_SECRET" {
  type    = string
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
}
variable "storage_name" {
  type    = string
  default = "localstorage"
}