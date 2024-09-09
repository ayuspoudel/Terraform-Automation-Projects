terraform {
  backend "s3" {
    bucket = "remote-backend-ayush"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
