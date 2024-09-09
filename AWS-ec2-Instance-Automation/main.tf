provider "aws" {
  region = "us-east-1"
}
module "ec2_instance" {
  source             = "./modules/ec2_instance"
  ami_id_value          = "ami-053b0d53c279acc90"
  instance_type_value = "t2.micro"
  subnet_id_value    = "subnet-03494f34098c13331"
}
