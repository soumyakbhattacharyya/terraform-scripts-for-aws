# Terraform Block
terraform {
  required_version = ">= 0.14" # which means any version equal & above 1.1.7
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.8"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"
    }
  }
}

# Provider Block
provider "aws" {
  region  = var.aws_region
  profile = "default"
}
/*
Note-1:  AWS Credentials Profile (profile = "default") configured on your local desktop terminal  
$HOME/.aws/credentials
*/
