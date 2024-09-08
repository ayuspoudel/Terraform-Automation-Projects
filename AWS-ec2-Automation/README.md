
# Terraform EC2 Automation

This repository contains Terraform configurations for automating the setup of an EC2 instance on AWS. The `main.tf` file defines the necessary resources to launch an EC2 instance with specific parameters.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads) installed on your machine.
- AWS account and access to create resources.
- AWS CLI configured with the appropriate credentials.

## Setup

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/ayuspoudel/Terraform-Automation-Projects.git
   cd Terraform-Automation-Projects/AWS-ec2-Automation
   ```

2. **Initialize Terraform:**

   Initialize the Terraform configuration. This step downloads the necessary provider plugins and sets up the backend.

   ```bash
   terraform init
   ```

3. **Review the Configuration:**

   Review the Terraform configuration files to ensure they match your requirements.

4. **Plan the Deployment:**

   Generate an execution plan to see the actions Terraform will take.

   ```bash
   terraform plan
   ```

5. **Apply the Configuration:**

   Apply the configuration to create the EC2 instance as defined in `main.tf`.

   ```bash
   terraform apply
   ```

   Confirm the action when prompted.

## Configuration

The `main.tf` file contains the following configuration:

- **AWS Provider:** Configures Terraform to use AWS as the provider.
- **EC2 Instance Resource:** Defines the EC2 instance with the following parameters:
  - `ami`: The Amazon Machine Image (AMI) ID to use for the instance.
  - `instance_type`: The type of EC2 instance to launch (e.g., `t2.micro`).
  - `subnet_id`: The subnet ID where the instance will be launched.
  - `key_name`: The name of the key pair for SSH access.

## Notes

- Modify the `ami`, `instance_type`, `subnet_id`, and `key_name` in the `main.tf` file according to your needs before running `terraform apply`.
- Ensure that your AWS account has the necessary permissions to create and manage EC2 instances.

## Troubleshooting

- **Invalid AMI ID:** Make sure the AMI ID specified is available in the AWS region you're targeting.
- **Subnets and Key Pairs:** Verify that the subnet ID and key pair specified exist in your AWS account.

## Contributing

Feel free to fork the repository and submit pull requests with improvements or fixes.

## License

This project is licensed under the MIT License. See the [LICENSE](../LICENSE) file for details.

