#provider "aws" {
#  region     = "us-west-1"
#  access_key = "AKIA4TIFA7FQ7H6VLI7O"
#  secret_key = "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"
#}


#module "instance" { 
#    source = "../../module/instance"
#    instance_count = 10
#    instance_type = "t2.micro"
#    env = "prod"   
/* tags = {
    Terraform   = "true"
    Environment = "prod"
  } */
#}

module "vpc" {
  source = "../../module/vpc"
  cidr_block           = "10.0.0.0/20"
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  azs                  = ["us-west-1a", "us-west-1c"]
  env                  = "prod"
  ns                   = "tata"
  tags = {
    name        = "rahul-kamde"
    owner       = "tata"
    data-center = "nagpur"
    start-date  = "18/08/2023"
  }
}




