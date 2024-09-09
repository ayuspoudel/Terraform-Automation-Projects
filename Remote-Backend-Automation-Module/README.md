
# Terraform Remote Backend Automation Module

## Overview

This repository contains Terraform configurations for automating the setup of AWS resources with remote state management using an S3 bucket. It includes modules for launching EC2 instances and creating S3 buckets, with state managed remotely.

## Screenshot
<img width="1190" alt="Screenshot 2024-09-09 at 17 11 27" src="https://github.com/user-attachments/assets/6a664906-e84f-4970-93b9-f972011cef24">


## Directory Structure

```
.
├── main.tf                # Main configuration file for Terraform
├── modules
│   ├── ec2_launch          # Module for launching EC2 instances
│   │   ├── backend.tf      # Backend configuration for remote state
│   │   ├── main.tf         # EC2 instance configuration
│   │   ├── output.tf       # Outputs from the EC2 module
│   │   └── variables.tf    # Variables used in the EC2 module
│   └── s3_create           # Module for creating S3 buckets
│       ├── main.tf         # S3 bucket configuration
│       ├── output.tf       # Outputs from the S3 module
│       └── variables.tf    # Variables used in the S3 module
└── terraform.tfstate       # Local state file (should be managed remotely)
```

## Setup

1. **Clone the Repository**

   ```bash
   git clone https://github.com/yourusername/terraform-remote-backend-automation-module.git
   cd terraform-remote-backend-automation-module
   ```

2. **Initialize Terraform**

   Initialize the Terraform configuration. This sets up the backend and prepares the modules for use.

   ```bash
   terraform init
   ```

3. **Plan and Apply Configuration**

   Generate an execution plan and apply the configuration to create the resources.

   ```bash
   terraform plan
   terraform apply
   ```

4. **Verify**

   Ensure that the EC2 instance and S3 bucket are created as expected. Check the remote S3 bucket for the `terraform.tfstate` file.

## Project Completion Steps

1. **Defining the EC2 Launch Module**

   - **Created** `modules/ec2_launch/main.tf` for defining an EC2 instance resource.
   - **Set up** necessary variables in `variables.tf` to make the module configurable.
   - **Configured** outputs in `output.tf` to expose information such as the instance ID.

2. **Setting Up the S3 Bucket Module**

   - **Defined** `modules/s3_create/main.tf` to create an S3 bucket for storing the Terraform state.
   - **Configured** the bucket with appropriate settings, such as versioning and access control.
   - **Added** outputs in `output.tf` to provide information like the bucket name and ARN.

3. **Configuring Remote Backend**

   - **Updated** `modules/ec2_launch/backend.tf` to specify the S3 bucket and DynamoDB table for state management.
   - **Ensured** proper configuration of the backend in `main.tf` to manage Terraform state remotely.

4. **Testing and Validation**

   - **Ran** `terraform init` to initialize the project and ensure the backend setup is correct.
   - **Used** `terraform plan` and `terraform apply` to create resources and verify their existence.
   - **Checked** the S3 bucket and EC2 instance to confirm successful deployment.

5. **Finalizing the Setup**

   - **Deleted** local `terraform.tfstate` files to rely on remote state management.
   - **Prepared** `README.md` and `.gitignore` files for documentation and to avoid committing sensitive data.
   - 

## Notes

- **S3 Bucket Configuration:** Ensure the S3 bucket specified in the `backend.tf` file is correctly configured and exists in the AWS region specified.
- **State Management:** Local state files should be managed remotely using S3. Ensure that the remote state configuration is properly set up before deleting local state files.
