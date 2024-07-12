# Creating a Spacelift stack.
resource "spacelift_stack" "managed-stack" {
 name        = "Stack managed by Spacelift"
 repository  = "my-awesome-repo"
 branch      = "master"
}
# Creating an IAM role.
resource "aws_iam_role" "managed-stack-role" {
 name = "spacelift-managed-stack-role"
 # Setting up the trust relationship.
 assume_role_policy = jsonencode({
   Version = "2012-10-17"
   Statement = [
     jsondecode(
       spacelift_stack.managed-stack.aws_assume_role_policy_statement
     )
   ]
 })
}
# Attaching a powerful administrative policy to the stack role.
resource "aws_iam_role_policy_attachment" "managed-stack-role" {
 role       = aws_iam_role.managed-stack-role.name
 policy_arn = "arn:aws:iam::aws:policy/PowerUserAccess"
}
# Linking AWS role to the Spacelift stack.
resource "spacelift_stack_aws_role" "managed-stack-role" {
 stack_id = spacelift_stack.managed-stack.id
 role_arn = aws_iam_role.managed-stack-role.arn
}