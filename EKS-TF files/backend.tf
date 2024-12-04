terraform {
  backend "s3" {
    bucket = "mario-bros-bucket" # Replace with your own S3 bucket name
    key    = "EKS/terraform.tfstate"
    region = "ap-south-1"
  }
}
