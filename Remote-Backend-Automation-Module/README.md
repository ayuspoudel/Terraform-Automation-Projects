# Terraform Remote Backend Automation Module

## Overview

This repository contains Terraform configurations for automating the setup of AWS resources with remote state management using an S3 bucket. It includes modules for launching EC2 instances and creating S3 buckets, with state managed remotely.

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

   ```bash
   terraform init
   ```

3. **Plan and Apply Configuration**

   ```bash
   terraform plan
   terraform apply
   ```

4. **Verify**

   Ensure that the EC2 instance and S3 bucket are created as expected. Check the remote S3 bucket for the `terraform.tfstate` file.

## Notes

- **S3 Bucket Configuration:** Make sure the S3 bucket specified in the `backend.tf` file is correctly configured and exists in the AWS region specified.
- **State Management:** Local state files should be managed remotely using S3. Ensure that the remote state configuration is properly set up before deleting local state files.


## Contributing

Feel free to submit issues or pull requests. Contributions are welcome!
