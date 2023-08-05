terraform {
  required_providers {
     aws = {
      source = "hashicorp/aws"
      version = "5.11.0"
    }

    #kubernetes = {
    #  source = "hashicorp/kubernetes"
    #  version = "2.22.0"
    #}
  }
}

provider "aws" {
  region     = "us-west-1"
  access_key = "AKIA4TIFA7FQZJJYE5AK"
  secret_key = "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"
}


resource "aws_iam_user" "demo" {
  name = "Shubham"
  
  tags = {
    tag-key = "asdf-value"
  }
}


resource "aws_iam_group" "demo2" {
  name = "kali-group"
}


resource "aws_iam_user_group_membership" "demo" {
  user = aws_iam_user.demo.name

  groups = [
    aws_iam_group.demo2.name
  ]
}

