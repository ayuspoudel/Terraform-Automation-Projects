provider "aws" {
 region="us-east-1" 
}

resource "aws_instance" "instance_name" {
  instance_type = var.instance_type_value
  ami = var.ami_id_value
  subnet_id = var.subnet_id_value
tags = {
    Name = var.name_instance
}
}
