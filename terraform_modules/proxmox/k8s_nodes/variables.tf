variable "stack_id" {
  type        = number
  description = "ID of Stack. Eg: 101"
}
variable "user" {
  type        = string
  description = "The default user from the nodes"
}
variable "workers" {
  type = object({
    qtd       = number
    cpu       = number
    memory    = number
    disk_size = number
  })
}
variable "masters" {
  type = object({
    qtd       = number
    cpu       = number
    memory    = number
    disk_size = number
  })
}