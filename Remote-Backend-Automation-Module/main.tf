module "ec2_launch" {
  source            = "./modules/ec2_launch"  # Path to your module directory
  instance_type_value = "t2.micro"
  ami_id_value       = "ami-0e86e20dae9224db8"
  subnet_id_value    = "subnet-0ec030ef60b5c9ee0 "
  name_instance      = "my-instance"
}
module "s3_create" {
  source = "./modules/s3_create"
  bucket_name = "remote-backend-ayush"
}
