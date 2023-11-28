terraform {
  backend "s3" {
    bucket = "devops72batch"
    key    = "roboshop-project/dev/terraform.tfstate"
    region = "us-east-1"
  }
}