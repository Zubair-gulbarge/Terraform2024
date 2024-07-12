variable "test_users" {
  type    = list(string)
  default = ["garp", "DRAGON", "luFFy", "roger", "ace"]
}

variable "index" {
  type    = number
  default = 0
}

output "selected_user" {
  value = var.index < length(var.test_users) ? var.test_users[var.index] : "Index out of range"
}
