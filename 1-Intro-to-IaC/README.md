# Introduction Terraform

1. **Introduction to IaC?**
- Infrastructure as Code (IaC) is a practice where infrastructure is provisioned and managed using code and automation tools, instead of manual processes. It enhances consistency, reduces errors, and enables version control for infrastructure management.

2. **What is Terraform?**
- Terraform is an open-source Infrastructure as Code (IaC) tool developed by HashiCorp. It allows users to define, provision, and manage cloud infrastructure using a high-level configuration language. Terraform supports various cloud providers and services, enabling consistent and repeatable infrastructure deployment.

3. **Why Terraform?**
- Terraform is preferred for infrastructure management because it offers:
1. **Multi-Cloud Support**: Works with various cloud providers like AWS, Azure, GCP, and on-premises solutions.
2. **Declarative Syntax**: Users define desired end-state, and Terraform handles the provisioning.
3. **Automation and Consistency**: Automates infrastructure setup, reducing manual errors and ensuring consistency.
4. **Version Control**: Infrastructure configurations can be versioned and treated like code.
5. **Modularity**: Supports reusable modules for efficient management of complex infrastructure.
6. **State Management**: Keeps track of infrastructure state, allowing incremental changes and management of dependencies.

4. **Terraform vs Ansible?**
- Ansible is a popular configuration management tool that automates infrastructure provisioning and configuration management.
- Terraform is an IaC tool that manages infrastructure as code, allowing users to define, provision, and manage cloud infrastructure using a high-level configuration language.

5. **Terraform Installation in Windows**
**Link** - https://developer.hashicorp.com/terraform/install?product_intent=terraform#windows

6. **Terraform Installation in Linux**
**Link** - https://developer.hashicorp.com/terraform/install?product_intent=terraform#linux

Here's a summary of common Terraform commands and their purposes:

1. **`terraform fmt`**: Formats the configuration files to follow Terraform's style conventions, ensuring proper indentation and spacing.
2. **`terraform init`**: Initializes the configuration directory, downloading necessary provider plugins and preparing the backend for state storage.
3. **`terraform validate`**: Validates the configuration files, checking for syntax errors and ensuring the configuration is syntactically correct.
4. **`terraform plan`**: Creates an execution plan, showing what actions Terraform will take to achieve the desired state defined in the configuration.
5. **`terraform apply`**: Applies the changes required to reach the desired state of the configuration, creating or updating resources.
6. **`terraform show`**: Displays the current state of the infrastructure as recorded in the state file, showing details of resources.
7. **`terraform destroy`**: Destroys the infrastructure managed by Terraform, removing all the resources defined in the configuration.
8. **`terraform output`**: Displays the output values defined in the configuration, often used for getting information about the resources created.

These commands are essential for managing infrastructure as code using Terraform, allowing for consistent, automated, and repeatable infrastructure provisioning and management.