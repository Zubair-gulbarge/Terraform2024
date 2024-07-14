# Creating key-pair for ssh connection
# resource "aws_key_pair" "key-tf" {
#   key_name   = "key-tf"
#   public_key = file("${path.module}/id_rsa.pub")
# }

# Output to check the public key
# output "key_name" {
#   value = aws_key_pair.key-tf.key_name
# }

# Creating security group
resource "aws_security_group" "sg-tf" {
  name        = "allow-tls"
  description = "Allow SSH, HTTP, HTTPS, MySQL, and MongoDB traffic"

  dynamic "ingress" {
    for_each = [22, 80, 443, 3306, 27017]
    content {
      description = "allowing traffic on port ${ingress.value}"
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

# EC2 instance
resource "aws_instance" "web" {
  ami                    = "ami-04a81a99f5ec58529"
  instance_type          = "t3.micro"
  key_name               = "terraform-key"
  vpc_security_group_ids = [aws_security_group.sg-tf.id]

  tags = {
    Name = "first-tf-instance"
  }
}