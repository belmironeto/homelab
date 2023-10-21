module "k8s_stack" {
  source   = "../../terraform_modules/proxmox/k8s_nodes"
  stack_id = 150
  masters = {
    qtd       = 3
    cpu       = 2
    disk_size = 65
    memory    = 6096
  }
  workers = {
    qtd       = 2
    disk_size = 65
    cpu       = 2
    memory    = 6196
  }
  user = "ubuntu"
  ssh_key = local.ssh_key
  
}
resource "local_file" "ansible_inventory" {
  content = templatefile("${local.inventory_template}",
  {
    masters_ip = module.k8s_stack.masters_ip
    workers_ip = module.k8s_stack.workers_ip
  })
  filename = "${local.ansible_directory}/${local.inventory_file_name}"

  provisioner "local-exec" {
    command = "ansible-playbook ${local.ansible_playbook} -i ${local.inventory_file_name} --ssh-common-args='-o StrictHostKeyChecking=no'"
    working_dir = local.ansible_directory
    environment = {
      ANSIBLE_DEPRECATION_WARNINGS = false
    }
  }
  provisioner "local-exec" {
    when = destroy
    command =  "ansible-playbook destroy_k8s.yml -i ${self.filename} --ssh-common-args='-o StrictHostKeyChecking=no'"
    working_dir = "../ansible_playbooks"
  }
}
