# Cloud Deployment Automation with Terraform

This repository contains the Terraform configuration to deploy a basic AWS infrastructure. It sets up a VPC, subnet, internet gateway, route table, security group, and an EC2 instance. Additionally, it provisions the EC2 instance with a simple Python application.

## Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Infrastructure Overview](#infrastructure-overview)
- [Deployment Instructions](#deployment-instructions)
- [Connecting to the EC2 Instance](#connecting-to-the-ec2-instance)
- [Screenshots](#screenshots)
- [Troubleshooting](#troubleshooting)
- [License](#license)

## Overview

The Terraform configuration deploys the following AWS infrastructure components:

- **AWS VPC (Virtual Private Cloud)**: A logically isolated network environment with a CIDR block of `10.0.0.0/16`. This VPC will host your subnet and resources.
- **Subnet**: A public subnet within the VPC with a CIDR block of `10.0.0.0/24`. This subnet is configured to map public IPs on launch.
- **Internet Gateway**: Attached to the VPC to provide internet access.
- **Route Table**: Routes all outbound traffic (0.0.0.0/0) to the internet gateway to allow external connectivity.
- **Security Group**: Configured to allow inbound HTTP (port 80) and SSH (port 22) access from anywhere, and allows all outbound traffic.
- **EC2 Instance**: A `t2.micro` instance running Ubuntu, configured to use a key pair for SSH access. The instance is provisioned with a simple Python script and Flask.

  

## Prerequisites

Before you start, ensure you have:

- [Terraform](https://www.terraform.io/downloads) installed on your local machine.
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html) configured with your AWS credentials.
- An AWS account.
- SSH key pair (`~/.ssh/id_rsa` and `~/.ssh/id_rsa.pub`) for secure access.

## Infrastructure Overview

### Key Pair

The SSH key pair is used for secure access to the EC2 instance. You should have a private key file (`id_rsa`) and a corresponding public key file (`id_rsa.pub`).

### VPC and Networking

The VPC provides a private network for your resources. The subnet is a public subnet to which the EC2 instance is connected. The internet gateway allows your instance to access the internet.
![image](https://github.com/user-attachments/assets/0822b4b5-5ffe-4270-8736-290b4a4fc3f4)


### Security Group

The security group controls inbound and outbound traffic to the EC2 instance. It allows HTTP traffic on port 80 and SSH traffic on port 22. All outbound traffic is permitted.
![image](https://github.com/user-attachments/assets/a7c9e859-1aa5-4d41-9314-c646fe190258)


### EC2 Instance

The EC2 instance is provisioned with Ubuntu and configured with a Python script. The instance is accessible via SSH using the key pair. The provisioning script installs necessary packages and runs a Flask application.

![image](https://github.com/user-attachments/assets/e930a096-b73f-445b-8450-8a43a089a59f)


## Deployment Instructions

1. **Initialize Terraform**

    Run the following command to initialize the Terraform working directory:

    ```sh
    terraform init
    ```

2. **Apply the Configuration**

    Deploy the infrastructure by applying the Terraform configuration:

    ```sh
    terraform apply
    ```

    Confirm the action when prompted. Terraform will create the VPC, subnet, and EC2 instance.


## Connecting to the EC2 Instance

1. **Obtain Public IP Address**

    Retrieve the public IP address of your EC2 instance from the AWS Management Console or via AWS CLI:

    ```sh
    aws ec2 describe-instances --instance-ids i-1234567890abcdef0 --query 'Reservations[*].Instances[*].[PublicIpAddress]' --output text
    ```

    ![image](https://github.com/user-attachments/assets/3dd964a5-1bec-496d-a95e-720e01865709)


2. **SSH into the Instance**

    Use the following command to SSH into your instance:

    ```sh
    ssh -i ~/.ssh/id_rsa ubuntu@public-ip-address
    ```

    Replace `public-ip-address` with the actual IP address.

## Screenshots

1. **Terraform Init Output**
    <img width="638" alt="image" src="https://github.com/user-attachments/assets/71069edd-665e-444d-9a06-5c8f8759ee04">

2. **Terraform Apply Output**
    <img width="666" alt="image" src="https://github.com/user-attachments/assets/bd99b33e-5c0d-4039-9b53-d86c5a6e1e9d">


3. **EC2 Instance Details**
    <img width="833" alt="image" src="https://github.com/user-attachments/assets/0003de47-cc29-4ce3-8c81-3c23729f8bf4">


## Troubleshooting

- **Permission Denied**: Ensure your private key file has correct permissions:

    ```sh
    chmod 400 ~/.ssh/id_rsa
    ```

- **Security Group Rules**: Confirm that the security group allows inbound SSH (port 22) and HTTP (port 80).

- **Username for EC2 Instance**: Verify the username based on your AMI. For Ubuntu, it is `ubuntu`.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

