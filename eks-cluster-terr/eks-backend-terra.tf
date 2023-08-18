#terraform {
#  backend "s3" {
#    bucket = "terraform-eks-backend-02"
#    key = "terraform.tfstate"
#    region = "us-west-1"
#    dynamodb_table = "eks-terraform-table"
#  }
#}




terraform {

    backend "s3" {
    access_key = "AKIA4TIFA7FQ6VBG3WQR"
    secret_key = "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"
    #endpoint = "https://s3.uk-1.wasabisys.com"
    region = "us-west-1"
    bucket = "terraform-eks-backend-02"
    key = "ovh/terraform.tfstate"
  }
}