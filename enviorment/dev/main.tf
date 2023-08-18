provider "aws" {
      region     = "us-west-1"
      access_key = "AKIA4TIFA7FQ7H6VLI7O"
      secret_key = "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"
    }


module "s3" {
  source = "../../modules/S3" 
  bucket_name = ["role-01", "role-02", "role-03", "role-04"]
  env = "dev"
}


#module "s3" { 
#    source = "../../modules/s3"
#    bucket_name = "ms-bucket-01"
#}