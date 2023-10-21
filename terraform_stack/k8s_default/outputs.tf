output "masters_ip" {
  value = module.k8s_stack.masters_ip
}
output "workers_ip" {
  value = module.k8s_stack.workers_ip
}