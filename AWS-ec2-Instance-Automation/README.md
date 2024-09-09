# AWS EC2 Instance Automation

This project is designed to automate the creation and management of AWS EC2 instances using Terraform. The infrastructure defined in this project allows for scalable, consistent, and repeatable EC2 instance deployments.

## Project Structure

```
AWS-ec2-Instance-Automation/
├── modules/
│   └── ec2_instance/
|        ├──main.tf
|        ├──variables.tf
|        ├──output.tf
├── .gitignore
├── .terraform.lock.hcl
├── main.tf
└── README.md
```

### Key Files
- **main.tf**: This is the main Terraform configuration file. It defines the infrastructure resources, including EC2 instances, security groups, and any other dependencies.
- **.gitignore**: Specifies files to be ignored by Git, such as local environment and Terraform-specific files like `.terraform` directories and `.tfstate` files.
- **.terraform.lock.hcl**: This file locks the Terraform module dependencies, ensuring consistent builds across different machines.

### Modules
- **modules/ec2_instance**: This folder contains reusable Terraform modules to define the EC2 instance configurations (such as instance type, AMI, key pair, security group, etc.).

## Prerequisites

- **Terraform**: Install the latest version of [Terraform](https://www.terraform.io/downloads.html).
- **AWS Account**: Ensure you have an AWS account with necessary permissions to create EC2 instances and related resources.

## Usage

1. **Clone the Repository**:

   ```bash
   git clone https://github.com/your-repository/AWS-ec2-Instance-Automation.git
   ```

2. **Navigate to the Directory**:

   ```bash
   cd AWS-ec2-Instance-Automation
   ```

3. **Initialize Terraform**:

   Run the following command to initialize the Terraform working directory:

   ```bash
   terraform init
   ```

4. **Apply Configuration**:

   Use the following command to create the resources defined in `main.tf`:

   ```bash
   terraform apply
   ```

   Review the proposed changes, then confirm by typing `yes`.

5. **Destroy Resources**:

   To clean up and delete the created resources, run:

   ```bash
   terraform destroy
   ```

## Customization

You can modify the `main.tf` file and the variables within the `ec2_instance` module to customize your EC2 instances, such as changing the instance type, adding tags, or configuring security groups.

## Features

- Automates EC2 instance provisioning with Terraform
- Modular design for reusability and flexibility
- Supports multiple instance types, AMIs, and configurations
- Infrastructure-as-code for version control and collaboration

## Contributions

Feel free to submit pull requests to improve the automation workflow, add new features, or fix any issues.

## License

This project is licensed under the MIT License. See the `LICENSE` file for more details.

