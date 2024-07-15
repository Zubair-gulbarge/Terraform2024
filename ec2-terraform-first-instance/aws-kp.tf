# Creating key-pair for ssh connection
# resource "aws_key_pair" "key-tf" {
#   key_name   = "key-tf"
#   public_key = file("${path.module}/id_rsa.pub")
# }

# Output to check the public key
# output "key_name" {
#   value = aws_key_pair.key-tf.key_name
# }
