resource "aws_instance" "example" {
    count           = local.instance_count
    instance_type   = local.instance_type
    ami             = local.ami
    key_name        = local.key_name
    tags = {
        Name = "${local.instance_name_pattern}${count.index + 1}"
        enviornment = var.enviornment
    }
}