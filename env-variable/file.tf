variable "username" {
  type = string
}

output "printname" {
  value = "Hello your name is ${var.username}"
}