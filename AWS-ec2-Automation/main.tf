provider "aws" {
  region = "us-east-1" # Set your desired region
}

resource "aws_instance" "this" {
  ami                     = "ami-0e86e20dae9224db8"
  instance_type           = "t2.micro"
  subnet_id               = "subnet-0ec030ef60b5c9ee0"
  key_name = "ultimate"
}