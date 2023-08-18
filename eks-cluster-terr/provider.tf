terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.11.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

/* provider "aws" {
  region     = "us-west-1"
  access_key = "AKIA4TIFA7FQ6VBG3WQR"
  secret_key = "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"
} */