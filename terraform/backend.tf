terraform {
  backend "s3" {
    bucket         = "my-tf-state-bucket-zhanyao"
    key            = "ec2/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}