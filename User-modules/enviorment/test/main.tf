provider "aws" {
      region     = "us-west-1"
      access_key = "AKIA4TIFA7FQ7H6VLI7O"
      secret_key = "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"
    }


#module "user" { 
#    source = "../../modules/user"
#    aws_iam_user_name = "rohit"
#}



module "user" {
  source = "../../modules/user" 
  aws_iam_user_name = ["balaji-01", "balaji-02", "balaji-03", "balaji-04", "balaji-05", "balaji-06", "balaji-07"]
  env = "test"
}
