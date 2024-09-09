provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "terraform-automation" {
    ami = var.ami_id_value
    instance_type = var.instance_type_value
    subnet_id = var.subnet_id_value
}