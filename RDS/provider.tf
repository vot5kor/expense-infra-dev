terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.33.0" # Terraform AWS provider version
    }
  }

  backend "s3" {
    bucket  = "kvn-tf-remote-state-dev" # Replace with your unique bucket name
    key     = "roboshop-dev-db"
    region  = "us-east-1"
    encrypt = true
    lock_table = "kvn-tf-remote-state-dev" # Replace with your DynamoDB table name for state locking
    # use_lockfile   = true
  }
}

provider "aws" {
  region = "us-east-1"
}