terraform {
  required_providers {
     aws = {
      source = "hashicorp/aws"
      version = "5.11.0"
    }
  }
}

provider "aws" {
      region     = "us-west-1"
      access_key = "AKIA4TIFA7FQ46XUYMWE"
      secret_key = "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"
    }


resource "aws_instance" "demo" {
  count = 2 
  ami = "ami-0c38b9e37c107d921"
  instance_type = "t2.micro"
}  

resource "aws_lb" "example" {
  name               = "example-lb"
  load_balancer_type = "application"
  subnets            = ["subnet-12345678", "subnet-87654321"]  # Replace with your subnet IDs
}