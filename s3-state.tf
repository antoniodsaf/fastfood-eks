terraform {
  backend "s3" {
    bucket = "fastfood-tf"
    key = "eks/terraform.tfstate"
    region = "us-east-1"
  }
}