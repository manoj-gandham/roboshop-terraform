terraform {
  backend "s3" {
    bucket = "devops72batch"
    key    = "roboshop-project/terraform.tfstate"
    region = "us-east-1"
  }
}