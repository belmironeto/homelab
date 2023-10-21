variable "PROXMOX_API_SECRET" {
  type    = string
  default = "6bf31dcb-368c-4458-81d4-e90833cec7e5"
  sensitive = true
}

variable "ssh_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDgy5YXm0+H4WKc314Q9JBa22c7kl5gvG3yR4FrtO2e9UrCQnRRc+K8124kBtsaC5R9csa4mHeVu//ipkPiQuKPZCw8YadhhtpRAV8scPMETfi593/0Nk+xBHpBQDA4uB24t5gZJ2DzQ4Wkl/+xK7sUI0fIwaEg0/qlxfY6pOnb/4gxxS/6Ls31SbZNG/2lQ4lntxYGmbfWbbrRUAMYju0kpBolqJ8WsI5+Je+kmjAvzhSINPalOb/6ov8euk0C/NaLacN+1ucZZ1g/ZoGvpm/Z42UYr1jHDskwDy7g2DCrW1XYZ0Q92Pp9UR/beJwRzF16skQpmqWK6lKiqyJFxfSl pi@raspberrypi"
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