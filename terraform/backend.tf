terraform {
  backend "s3" {
    bucket         = "cloud-project-tf-state-us-east-1"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "cloud-project-tf-locks"
    encrypt        = true
  }
}