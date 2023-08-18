terraform {
  required_providers {
     aws = {
      source = "hashicorp/aws"
      version = "5.11.0"
    }

    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.22.0"
    }
  }
}

provider "aws" {
  region     = "us-west-1"
  access_key = "AKIA4TIFA7FQXSPTP3Q7"
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

#import {
#  to = aws_iam_user.demo
#  id = "Abhishek"
#}


#resource "aws_instance" "demo" {
#  ami = "unknown"
#  instance_type = "unknown"
#}
#
#import {
#  to = aws_instance.demo
#  id = "i-0fd615098edc24cd0"
#}

# terraform import aws_iam_user.demo Abhishek 


#resource "aws_s3_bucket" "my_buckey" {
#  bucket = "yuiolsdf"
#  acl = "private"
#
#  lifecycle {
#    prevent_destroy = true 
#  }
#  versioning {
#    enabled = true
#  }
#
#  tags = {
#    Name = "my-buck"
#  }
#}
#
#
#resource "aws_dynamodb_table" "forstate" {
#  name = "for_state_lock"
#  hash_key = "lockID"
#  read_capacity = "8"
#  write_capacity = "8"
#
#  attribute {
#    name = "lockID"
#    type = "S"
#  }
#
#  tags = {
#    name = "statelock"
#  }
#  depends_on = [aws_s3_bucket.my_buckey]
#}
#
#
#terraform {
#  backend "s3" {
#    bucket = "yuiolsdf"
#    key = "terraform.tfstate"
#    region = "us-west-1"
#    dynamodb_table = "for_state_lock"
#    encrypt = true
#  }  
#} 
