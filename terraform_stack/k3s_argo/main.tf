module "k3s_instance" {
  source = "../../terraform_modules/proxmox"
  template_name = local.template_name
  ssh_key = local.ssh_key
  vm = {
    name = "ARGOCD"
    id = 120
    cpu = 2
    memory = 2048
    disk_size = 65
    ip = "192.168.1.100"
    user = "ubuntu"
    tags = "K3S argocd"
  }
  PROXMOX_API_SECRET = "${var.PROXMOX_API_SECRET}"
}
resource "local_file" "ansible_inventory" {
  content = templatefile(local.inventory_template,
  {
    vm_ip = module.k3s_instance.vm_ip
  })
  filename = "${local.ansible_playbook_dir}inventory.yml"

  provisioner "local-exec" {
    command = "ansible-playbook main.yml -i inventory.yml --ssh-common-args='-o StrictHostKeyChecking=no'"
    working_dir = local.ansible_playbook_dir
    environment = {
      ANSIBLE_DEPRECATION_WARNINGS = false
    }
  }
}
