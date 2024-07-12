locals {
    instance_type           = "t2.micro"
    instance_count          = 2
    region                  = "us-east-1"
    ami                     = "ami-0c02fb55956c7d316"
    key_name                = "aws-key"
    instance_name_pattern   = "web-${var.enviornment}-"
    availability_zones      = ["us-east-1a","us-east-1b","us-east-1c"]
}