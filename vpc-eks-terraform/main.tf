# terraform {
#   backend "s3" {
#     bucket = "terraform-state-bucket"
#     key    = "terraform.tfstate"
#     region = "us-east-1"
#     encrypt = true
#   }
# }

resource "aws_vpc" "test-vpc" {
  cidr_block = var.vpc_cidr
  
  tags = {
    Name = "test-vpc"
  }
}

# variable "public_subnet_cidrs" {
#   type        = list(string)
#   description = "Public Subnet CIDR values"
#   default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
# }

# variable "private_subnet_cidrs" {
#   type        = list(string)
#   description = "Private Subnet CIDR values"
#   default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
# }

# variable "azs" {
#   type        = list(string)
#   description = "Availability Zones"
#   default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
# }

resource "aws_subnet" "public_subnets" {
  count             = length(var.public_subnet_cidrs)
  vpc_id            = aws_vpc.test-vpc.id
  cidr_block        = element(var.public_subnet_cidrs, count.index)
  availability_zone = element(var.azs, count.index)
  
  tags = {
    Name = "Public Subnet ${count.index + 1}"
  }
}
 
resource "aws_subnet" "private_subnets" {
  count             = length(var.private_subnet_cidrs)
  vpc_id            = aws_vpc.test-vpc.id
  cidr_block        = element(var.private_subnet_cidrs, count.index)
  availability_zone = element(var.azs, count.index)
  
  tags = {
    Name = "Private Subnet ${count.index + 1}"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.test-vpc.id
  
  tags = {
    Name = "test-vpc-IG"
  }
}

resource "aws_route_table" "second_rt" {
  vpc_id = aws_vpc.test-vpc.id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  
  tags = {
    Name = "2nd-test-vpc-rt"
  }
}

resource "aws_route_table_association" "public_subnet_asso" {
  count = length(var.public_subnet_cidrs)
  subnet_id      = element(aws_subnet.public_subnets[*].id, count.index)
  route_table_id = aws_route_table.second_rt.id
}
