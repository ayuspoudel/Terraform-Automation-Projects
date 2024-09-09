
# Terraform Automation Projects

## Overview

This repository contains multiple Terraform configurations for automating AWS infrastructure setups. It includes modules and configurations for EC2 instance automation, remote backend setup using S3, and general automation tasks. Each project is organized into its own directory, and configurations are tailored for specific tasks.

## Directory Structure

```
.
├── AWS-ec2-Automation
│   ├── README.md
│   ├── main.tf
│   ├── terraform.tfstate
│   └── terraform.tfstate.backup
├── AWS-ec2-Instance-Automation
│   ├── README.md
│   ├── main.tf
│   ├── modules
│   │   └── ec2_instance
│   │       ├── main.tf
│   │       ├── outputs.tf
│   │       └── variables.tf
│   ├── terraform.tfstate
│   └── terraform.tfstate.backup
├── README.md
├── Remote-Backend-Automation-Module
│   ├── backend.tf
│   ├── main.tf
│   ├── modules
│   │   ├── ec2_launch
│   │   │   ├── main.tf
│   │   │   ├── output.tf
│   │   │   └── variables.tf
│   │   └── s3_create
│   │       ├── main.tf
│   │       ├── output.tf
│   │       └── variables.tf
│   └── terraform.tfstate.backup
├── gitignore
└── terraform.tfstate
```

## Projects

### **1. AWS-ec2-Automation**

This directory contains Terraform configuration files for setting up an AWS EC2 instance.

- `main.tf`: Main configuration for EC2 instance.
- `terraform.tfstate`: Terraform state file.
- `terraform.tfstate.backup`: Backup of the Terraform state file.
- `README.md`: Documentation specific to the EC2 automation project.

### **2. AWS-ec2-Instance-Automation**

This directory includes Terraform configurations and modules for automating the deployment of EC2 instances.

- `main.tf`: Main configuration file that utilizes the `ec2_instance` module.
- `modules/ec2_instance/`: Contains the module used to define EC2 instances.
  - `main.tf`: EC2 instance resource configuration.
  - `outputs.tf`: Outputs from the EC2 module.
  - `variables.tf`: Variables used in the EC2 module.
- `terraform.tfstate`: Terraform state file.
- `terraform.tfstate.backup`: Backup of the Terraform state file.
- `README.md`: Documentation specific to the EC2 instance automation project.

### **3. Remote-Backend-Automation-Module**

This directory contains configurations for setting up a remote backend using S3 and DynamoDB for state management.

- `backend.tf`: Backend configuration for using S3 as the remote state store.
- `main.tf`: Main configuration that includes the `ec2_launch` and `s3_create` modules.
- `modules/`: Contains Terraform modules for EC2 and S3.
  - `ec2_launch/`: Module for launching EC2 instances.
    - `main.tf`: Configuration for EC2 instances.
    - `output.tf`: Outputs from the EC2 launch module.
    - `variables.tf`: Variables used in the EC2 launch module.
  - `s3_create/`: Module for creating S3 buckets.
    - `main.tf`: Configuration for S3 bucket creation.
    - `output.tf`: Outputs from the S3 module.
    - `variables.tf`: Variables used in the S3 module.
- `terraform.tfstate.backup`: Backup of the Terraform state file.

## Setup

1. **Clone the Repository**

   ```bash
   git clone https://github.com/yourusername/terraform-automation-projects.git
   cd terraform-automation-projects
   ```

2. **Navigate to Each Project Directory**

   For each project, follow the steps below:

   ```bash
   cd <project-directory>
   ```

3. **Initialize Terraform**

   Initialize the Terraform configuration to set up the backend and prepare modules.

   ```bash
   terraform init
   ```

4. **Plan and Apply Configuration**

   Generate an execution plan and apply the configuration to create resources.

   ```bash
   terraform plan
   terraform apply
   ```

5. **Verify**

   Check AWS resources to ensure they have been created as expected.

## Notes

- **State Management:** Ensure that remote state management is correctly configured in `Remote-Backend-Automation-Module`.
- **S3 Bucket:** Make sure the S3 bucket for storing Terraform state is properly set up and configured.
- **EC2 Instances:** Verify that the EC2 instances are created and configured as desired.


## Contributing

Feel free to submit issues or pull requests. Contributions are welcome!

## Contact

For questions or comments, please reach out to [your-email@example.com](mailto:your-email@example.com).
