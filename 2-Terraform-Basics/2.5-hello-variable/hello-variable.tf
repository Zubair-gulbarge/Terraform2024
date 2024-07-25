// variable username { }


output "printname" {
 // value = "Hello var.username"
 value = "Hello, ${var.username}"
}

output "nameAge" {
 value = "Hello, ${var.username}, your age is ${var.age}."
}