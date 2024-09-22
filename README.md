

# Terraform Automation Projects

This repository contains multiple Terraform configurations for automating AWS infrastructure setups. Each project is organized into its own directory, with modules and configurations tailored for specific tasks such as EC2 instance automation, cloud deployment, and remote backend setup using S3.

## Directory Structure

```
.
├── AWS-ec2-Automation
│   ├── README.md
│   ├── main.tf
│   ├── terraform.tfstate
│   └── terraform.tfstate.backup
├── AWS-ec2-Instance-Automation
│   ├── README.md
│   ├── main.tf
│   ├── modules
│   │   └── ec2_instance
│   │       ├── main.tf
│   │       ├── outputs.tf
│   │       └── variables.tf
│   ├── terraform.tfstate
│   └── terraform.tfstate.backup
├── Cloud-Deployment-Automation
│   ├── README.md
│   ├── app.py
│   ├── graph.png
│   ├── main.tf
│   ├── plan.json
│   ├── plan.out
│   ├── terraform.tfstate
│   └── terraform.tfstate.backup
├── ECommerce-Web--EC2-S3-Deployment-Automation
│   ├── E-Commerce-Website
│   │   ├── cart.html
│   │   ├── images
│   │   │   ├── img-1.jpg
│   │   │   ├── img-10.png
│   │   │   ├── img-11.png
│   │   │   ├── img-12.png
│   │   │   ├── img-2.jpg
│   │   │   ├── img-3.jpg
│   │   │   ├── img-4.jpg
│   │   │   ├── img-5.png
│   │   │   ├── img-6.png
│   │   │   ├── img-7.png
│   │   │   ├── img-8.png
│   │   │   └── img-9.png
│   │   ├── index.html
│   │   └── src
│   │       ├── Data.js
│   │       ├── cart.js
│   │       ├── main.js
│   │       └── style.css
│   ├── README.md
│   ├── arc.png
│   ├── main.tf
│   ├── provider.tf
│   ├── terraform.tfstate
│   ├── terraform.tfstate.backup
│   ├── upload_to_s3.yml
│   ├── user_data1.sh
│   └── user_data2.sh
├── Full-Stack-EC2-S3-Deployment-Automation
│   └── main.tf
├── README.md
├── Remote-Backend-Automation-Module
│   ├── README.md
│   ├── backend.tf
│   ├── main.tf
│   ├── modules
│   │   ├── ec2_launch
│   │   │   ├── main.tf
│   │   │   ├── output.tf
│   │   │   └── variables.tf
│   │   └── s3_create
│   │       ├── main.tf
│   │       ├── output.tf
│   │       └── variables.tf
│   └── terraform.tfstate.backup
├── .gitignore
└── terraform.tfstate
```

## Projects

### 1. AWS-ec2-Automation
This directory contains Terraform configuration files for setting up an AWS EC2 instance.

- **main.tf**: Main configuration for the EC2 instance.
- **terraform.tfstate**: Terraform state file.
- **terraform.tfstate.backup**: Backup of the Terraform state file.
- **README.md**: Documentation specific to the EC2 automation project.

### 2. AWS-ec2-Instance-Automation
This directory includes Terraform configurations and modules for automating the deployment of EC2 instances.

- **main.tf**: Main configuration file utilizing the `ec2_instance` module.
- **modules/ec2_instance/**: Contains the module used to define EC2 instances.
  - **main.tf**: EC2 instance resource configuration.
  - **outputs.tf**: Outputs from the EC2 module.
  - **variables.tf**: Variables used in the EC2 module.
- **terraform.tfstate**: Terraform state file.
- **terraform.tfstate.backup**: Backup of the Terraform state file.
- **README.md**: Documentation specific to the EC2 instance automation project.

### 3. Cloud-Deployment-Automation
This directory focuses on automating cloud deployment tasks.

- **main.tf**: Main Terraform configuration file.
- **app.py**: Python application file used in the deployment.
- **graph.png**: Visual representation of the deployment architecture.
- **plan.json**: JSON file of the Terraform plan.
- **plan.out**: Output of the Terraform plan.
- **terraform.tfstate**: Terraform state file.
- **terraform.tfstate.backup**: Backup of the Terraform state file.
- **README.md**: Documentation for cloud deployment automation.

### 4. ECommerce-Web--EC2-S3-Deployment-Automation
This directory contains Terraform configurations for automating the deployment of an e-commerce website using EC2 and S3.

- **E-Commerce-Website/**: Contains the website files.
  - **cart.html**: HTML file for the shopping cart.
  - **images/**: Image assets used in the website.
  - **src/**: JavaScript and CSS files for website functionality and styling.
    - **Data.js**
    - **cart.js**
    - **main.js**
    - **style.css**
  - **index.html**: Main HTML file for the website.
- **README.md**: Documentation specific to the e-commerce deployment project.
- **arc.png**: Architecture diagram of the deployment.
- **main.tf**: Main Terraform configuration file.
- **provider.tf**: Provider configuration file.
- **terraform.tfstate**: Terraform state file.
- **terraform.tfstate.backup**: Backup of the Terraform state file.
- **upload_to_s3.yml**: YAML script for uploading files to S3.
- **user_data1.sh**: User data script 1 for EC2 instance initialization.
- **user_data2.sh**: User data script 2 for EC2 instance initialization.

### 5. Full-Stack-EC2-S3-Deployment-Automation
This directory contains a Terraform configuration file for deploying a full-stack application on EC2 with S3 integration.

- **main.tf**: Main Terraform configuration file.

### 6. Remote-Backend-Automation-Module
This directory contains configurations for setting up a remote backend using S3 and DynamoDB for state management.

- **backend.tf**: Backend configuration for using S3 as the remote state store.
- **main.tf**: Main configuration that includes the `ec2_launch` and `s3_create` modules.
- **modules/**: Contains Terraform modules for EC2 and S3.
  - **ec2_launch/**: Module for launching EC2 instances.
    - **main.tf**: Configuration for EC2 instances.
    - **output.tf**: Outputs from the EC2 launch module.
    - **variables.tf**: Variables used in the EC2 launch module.
  - **s3_create/**: Module for creating S3 buckets.
    - **main.tf**: Configuration for S3 bucket creation.
    - **output.tf**: Outputs from the S3 module.
    - **variables.tf**: Variables used in the S3 module.
- **terraform.tfstate.backup**: Backup of the Terraform state file.
- **README.md**: Documentation for remote backend automation.

## Setup

### Clone the Repository

```bash
git clone https://github.com/ayuspoudel/terraform-automation-projects.git
cd terraform-automation-projects
```

### Navigate to Each Project Directory

For each project, follow the steps below:

```bash
cd <project-directory>
```

### Initialize Terraform

Initialize the Terraform configuration to set up the backend and prepare modules.

```bash
terraform init
```

### Plan and Apply Configuration

Generate an execution plan and apply the configuration to create resources.

```bash
terraform plan
terraform apply
```

### Verify

Check AWS resources to ensure they have been created as expected.

## Notes

- **State Management**: Ensure that remote state management is correctly configured in `Remote-Backend-Automation-Module`.
- **S3 Bucket**: Make sure the S3 bucket for storing Terraform state is properly set up and configured.
- **EC2 Instances**: Verify that the EC2 instances are created and configured as desired.

## Contributing

Feel free to submit issues or pull requests. Contributions are welcome!

## Contact

For questions or comments, please reach out to your-email@example.com.

