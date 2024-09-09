variable "instance_type_value" {
  description = "Instance type for EC2"
  type=string
}
variable "name_instance" {
  description = "Name of the instance"
    type=string
}
variable "ami_id_value" {
  description = "AMI id for the instance"
    type=string
}
variable "subnet_id_value" {
  description = "Subnet id for the VPC of instance"
    type=string
}
