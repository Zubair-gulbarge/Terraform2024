variable "userage" {
  type = map 
  default = {
    shanks = 30
    luffy  = 15
    zoro   = 20
    nami   = 16
  }
}

variable "username" {
  type = string
}

output "userage" {
  value = "my name is ${var.username} and my age is ${lookup(var.userage, "${var.username}")}"
}