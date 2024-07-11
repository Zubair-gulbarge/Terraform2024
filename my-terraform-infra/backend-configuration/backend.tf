# For local backed configuration
# terraform {
#     backend "local" {
#         path = "terraform.tfstate" # Mention your file path here.
#     }
# }

terraform {
  backend "s3" {
    bucket = "terraform-state-bucket"
    key    = "terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    # dynamodb_table = "my-lock-table" # optional: Dynamodb table for state locking 
    }
}