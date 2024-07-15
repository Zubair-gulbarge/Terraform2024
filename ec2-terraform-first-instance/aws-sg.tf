# Creating security group
# resource "aws_security_group" "sg-tf" {
#   name        = "allow-tls"
#   description = "Allow SSH, HTTP, HTTPS, MySQL, and MongoDB traffic"

#   dynamic "ingress" {
#     for_each = var.ports
#     content {
#       description = "allowing traffic on port ${ingress.value}"
#       from_port   = ingress.value
#       to_port     = ingress.value
#       protocol    = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]
#     }
#   }

#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }
# }