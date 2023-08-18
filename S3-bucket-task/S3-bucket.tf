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




resource "aws_s3_bucket" "dev_buckets" {
  count         = length(var.s3_bucket_names) //count will be 5
  bucket        = var.s3_bucket_names[count.index]
  #acl           = "private"
  #region        = "us-wset-1"
  force_destroy = true
}

variable "s3_bucket_names" {
  type = list
  default = ["asdf-bucket-01", "ghjk-bucket-02", "qwer-bucket-03", "tyui-bucket-04", "zxcv-bucket-05" ]
}


