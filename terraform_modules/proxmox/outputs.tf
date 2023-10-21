output "vm_ip" {
  value = [split("/", split("=", proxmox_vm_qemu.generic_vm.ipconfig0)[1])[0]]
}