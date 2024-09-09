output "public_ip" {
    description = "Print public ip of the instance"
    value = aws_instance.terraform-automation.public_ip
}