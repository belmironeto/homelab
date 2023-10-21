output "masters_ip" {
  value = [for ip in proxmox_vm_qemu.k8s-master[*].ipconfig0: split("/", split("=", ip)[1])[0]]
}
output "workers_ip" {
  value = [for ip in proxmox_vm_qemu.k8s-workers[*].ipconfig0: split("/", split("=", ip)[1])[0]]
}