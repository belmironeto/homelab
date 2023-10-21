locals {
  inventory_template = "./inventory.tftpl"
  inventory_file_name = "k8s_inventory.yml"
  ansible_directory = "/home/belmiro/homelab/ansible_playbooks"
  ansible_playbook = "create_k8s_cluster.yml"
  ansible_playbook_destroy = "remove_k8s_from_argo.yml"
  ssh_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCebaWJa6jYnptwms7E4XkqeJ78NTG8nnVo0556p5L1Le+GRpEryU8JUznyiuamgDDFXXSDaN1YWO38tLYwxg/J4YHi4Luj2t5sv6ThM4cSTB15i44XfVjJsv9Vb1KTuFFT567H5i1yjgwoERq0+L8cHC2T8GNW4Sb16a2LTYL1qhoWd9SO7yxFhTkK5jtmnw+5U4Fb+ngP4aJJE5OmHvXZiBS/CCCTEm22EoAspTttlIc2aC//BkAkv9t8OX7qmftGzxDqXacjBLieRgMlsSelMjRh3p6xfrk/KygHExsAsRhOCQCkgrwl8XDQ/VO1pNyABWEHVmnxGic4A0edamAJeEJmMlWWtGJh5GD2T5TZt3i5zx+QM/Aot63sJgOwsDiUxPrKa4/nnhr5KagOIDMykgsoZNrqsiSNyxWGEv4mvg4B3WoXZmGYJZOVELXuF2cg8nBMfSiXU/JnvSB+lGHVglakV1buqgNYeG+nLSG9dz133qr1O21826YcGb6zFzc= belmiro@raspberrypi \n ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDLDQHm8uUttsO5ChROxnA6Ve4WuMM+rxfLWzzxlCbHHZyR/FxG3guoyqMaXIhvj9lFChrWOuGA8Kx5fYwkpqRh+R6P/L8HfHvE6GFqFLF/j9o23loQ8Cp6HVcdDKSX+V3/lYuxBkdWhIV9cRPb9CmTNQ5RZpAWH6VS99BhWc5zf0Bcg8BRl34+lHm83ySN7RzQVtWM323HVM2mrB+dPj1c+sD5ycftqr1SOSNsSToOhpQl5F7AlVkaT4Dtd2KAwb1GyYWx6aFOB0dAKiRZOQZi/YKSSlaiMd+1dI9O2uYS8joXDnNlg9Sxk+MrYF7hlvlTjBntZ7ZJy+oefeyRL6R2ROoXymj4DkehM73HrFuUe/uLHhIxDLFrfLq1rV/qlnCX7zPQIqERLIJD03lxMDm2xK0sISjkM4I3WX3XSBYhKn289wJZYMLtKZQwAOYazoO5morL4RkxLAmclmJ/LlrAKPcdsGSp+XU4bQ2YhQ1AKdUFkq1j7ySt0oNKR38//sU= belmiro.neto@C02G912MQ05H"
}