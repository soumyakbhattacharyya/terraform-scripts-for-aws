terraform {
  required_version = "~> 1.2.2" # terraform CLI version
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.17.1" # AWS module version
    }
  }
}

provider "aws" {
  # Configuration options
}