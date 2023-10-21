locals {
  inventory_template = "inventory.tftpl"
  template_name = "ubuntu-2204-cloud-init"
  ssh_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCebaWJa6jYnptwms7E4XkqeJ78NTG8nnVo0556p5L1Le+GRpEryU8JUznyiuamgDDFXXSDaN1YWO38tLYwxg/J4YHi4Luj2t5sv6ThM4cSTB15i44XfVjJsv9Vb1KTuFFT567H5i1yjgwoERq0+L8cHC2T8GNW4Sb16a2LTYL1qhoWd9SO7yxFhTkK5jtmnw+5U4Fb+ngP4aJJE5OmHvXZiBS/CCCTEm22EoAspTttlIc2aC//BkAkv9t8OX7qmftGzxDqXacjBLieRgMlsSelMjRh3p6xfrk/KygHExsAsRhOCQCkgrwl8XDQ/VO1pNyABWEHVmnxGic4A0edamAJeEJmMlWWtGJh5GD2T5TZt3i5zx+QM/Aot63sJgOwsDiUxPrKa4/nnhr5KagOIDMykgsoZNrqsiSNyxWGEv4mvg4B3WoXZmGYJZOVELXuF2cg8nBMfSiXU/JnvSB+lGHVglakV1buqgNYeG+nLSG9dz133qr1O21826YcGb6zFzc= belmiro@raspberrypi"
  ansible_playbook_dir = "/home/belmiro/homelab/ansible_playbooks/prepare_argo/"
}

variable "PROXMOX_API_SECRET" {
  type = string
  description = "This variable is being set by Environment Variable"
}