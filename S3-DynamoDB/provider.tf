# versions.tf
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.84.0"   # use v5.x instead of v6.x
    }
  }
}

provider "aws" {
  region = "us-east-1"
}