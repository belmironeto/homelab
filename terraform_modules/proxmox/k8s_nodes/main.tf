resource "proxmox_vm_qemu" "k8s-master" {
  count       = var.masters.qtd
  name        = "k8sm0${count.index + 1}.local.domain"
  target_node = var.proxmox_host
  vmid        = "${var.stack_id}${count.index + 1}"
  clone       = var.template_name
  os_type     = "cloud-init"
  qemu_os     = "l26"
  cpu         = "kvm64"
  cores       = var.masters.cpu / 2
  sockets     = 2
  memory      = var.masters.memory
  scsihw      = "virtio-scsi-pci"
  bootdisk    = "scsi0"

  disk {
    slot     = 0
    size     = "${var.masters.disk_size}G"
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

  ipconfig0 = "ip=192.168.1.10${count.index + 1}/24,gw=192.168.1.1"
  ciuser    = var.user
  sshkeys   = <<EOF
  ${var.ssh_key}
  EOF

  tags = "k8s"
}

resource "proxmox_vm_qemu" "k8s-workers" {
  count       = var.workers.qtd
  name        = "k8sw0${count.index + 1}.local.domain"
  target_node = var.proxmox_host
  vmid        = "${var.stack_id}${sum([var.masters.qtd, count.index, 1])}"
  clone       = var.template_name
  os_type     = "cloud-init"
  qemu_os     = "l26"
  cpu         = "kvm64"
  cores       = var.workers.cpu / 2
  sockets     = 2
  memory      = var.workers.memory
  scsihw      = "virtio-scsi-pci"
  bootdisk    = "scsi0"

  disk {
    slot     = 0
    size     = "${var.workers.disk_size}G"
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

  ipconfig0 = "ip=192.168.1.13${count.index + 1}/24,gw=192.168.1.1"
  ciuser    = var.user
  sshkeys   = <<EOF
  ${var.ssh_key}
  EOF

  tags = "k8s"
}