variable "instance_type"{
    description = "EC2 instance type"
    type = string
    default = "t2.micro"
    }
variable "ami_id"{
    description = "AMI id for OS"
    type = string
    #default = "ami-0e86e20dae9224db8"
    }

provider "aws"{
    region = "us-east-1"
}

resource "aws_instance" "example-instance" {
  ami = var.ami_id
  instance_type = var.instance_type

}

output "public_ip" {
    description = "Print Public IP of example instance"
  value ="aws_instance.example-instance.public_ip"
}
