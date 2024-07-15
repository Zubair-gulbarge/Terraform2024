# EC2 instance
resource "aws_instance" "web" {
  ami                    = "${var.image_id}"
  instance_type          = "${var.instance_type}"
  key_name               = "terraform-key"
  vpc_security_group_ids = ["sg-0af98847e8dbc2760"]
  # vpc_security_group_ids = [aws_security_group.sg-tf.id]

  tags = {
    Name = "first-tf-instance"
  }
  user_data = file("${path.module}/script.sh")
}