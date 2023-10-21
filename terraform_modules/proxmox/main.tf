resource "proxmox_vm_qemu" "generic_vm" {
  name        = var.vm.name
  target_node = var.proxmox_host
  vmid        = var.vm.id
  clone       = var.template_name
  os_type     = "cloud-init"
  qemu_os     = "l26"
  cpu         = "kvm64"
  cores       = var.vm.cpu / 2
  sockets     = 2
  memory      = var.vm.memory
  scsihw      = "virtio-scsi-pci"
  bootdisk    = "scsi0"

  disk {
    slot     = 0
    size     = "${var.vm.disk_size}G"
    type     = "scsi"
    storage  = var.storage_name
    iothread = 0
  }
  network {
    model     = "virtio"
    bridge    = "vmbr0"
    firewall  = false
    link_down = false
  }

  ipconfig0 = "ip=${var.vm.ip}/24,gw=192.168.1.1"
  ciuser    = var.vm.user
  sshkeys   = <<EOF
  ${var.ssh_key}
  EOF

  tags = var.vm.tags
}